import { goto } from "$app/navigation";
import db from "./db/db.svelte";
import type { Usuario } from "./types";

class AuthStore {
    user = $state<Usuario | null>(null);
    loading = $state(true);
    initialized = $state(false);

    async init() {
        if (this.initialized) return;

        const storedUserId = localStorage.getItem("auth_user_id");
        if (storedUserId) {
            try {
                // Wait for DB to be ready if it's not (though init usually called after db.init)
                // But since db is also a store, we might need to wait or just query.
                // Assuming db.init() is awaited in layout before auth.init().

                const users = await db.select<Usuario>(
                    "SELECT * FROM usuarios WHERE id = $1",
                    [storedUserId],
                );
                if (users.length > 0) {
                    this.user = users[0];
                } else {
                    localStorage.removeItem("auth_user_id");
                }
            } catch (e) {
                console.error("Failed to restore session", e);
                localStorage.removeItem("auth_user_id");
            }
        }
        this.loading = false;
        this.initialized = true;
    }

    async login(username: string, passwordHash: string): Promise<boolean> {
        try {
            const users = await db.select<Usuario>(
                "SELECT * FROM usuarios WHERE username = $1",
                [username],
            );

            if (users.length === 0) return false;

            const user = users[0];

            // Simple plaintext check for now as per plan
            if (user.password_hash === passwordHash) {
                this.user = user;
                localStorage.setItem("auth_user_id", user.id.toString());
                return true;
            }

            return false;
        } catch (e) {
            console.error("Login failed", e);
            throw e;
        }
    }

    async logout() {
        this.user = null;
        localStorage.removeItem("auth_user_id");
        await goto("/login");
    }
}

export const auth = new AuthStore();
