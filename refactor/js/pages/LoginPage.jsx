import React, { useState } from 'react';
import '../../css/login.css'; // Importa o CSS para a página de login

function LoginPage() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [message, setMessage] = useState('');

    const handleLogin = async (event) => {
        event.preventDefault();
        setMessage('');

        try {
            const response = await fetch('http://localhost/refactor/php/api/login.php', { // Ajuste a URL da API conforme necessário
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ nome: username, senha: password }),
            });

            const data = await response.json();

            if (response.ok) {
                setMessage(data.message);
                // Aqui você pode armazenar os dados do usuário (permissões, etc.) no estado global ou localStorage
                console.log('User data:', data.user);
                // Redirecionar para a página principal ou dashboard
                // window.location.href = '/dashboard';
            } else {
                setMessage(data.message || 'Erro ao fazer login.');
            }
        } catch (error) {
            console.error('Erro de rede:', error);
            setMessage('Erro de conexão com o servidor.');
        }
    };

    return (
        <div className="login-container">
            <div className="login-box">
                <img src="/path/to/your/image.jpg" alt="Logo" className="login-logo" /> {/* Substitua pelo caminho da sua imagem */}
                <h2>Login</h2>
                <form onSubmit={handleLogin}>
                    <div className="form-group">
                        <label htmlFor="username">Usuário:</label>
                        <input
                            type="text"
                            id="username"
                            value={username}
                            onChange={(e) => setUsername(e.target.value)}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="password">Senha:</label>
                        <input
                            type="password"
                            id="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            required
                        />
                    </div>
                    <button type="submit" className="login-button">Entrar</button>
                </form>
                {message && <p className="login-message">{message}</p>}
            </div>
        </div>
    );
}

export default LoginPage;