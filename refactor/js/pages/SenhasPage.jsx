import React, { useState, useEffect, useRef } from 'react';
import { useNavigate } from 'react-router-dom';

const SenhasPage = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [message, setMessage] = useState('');
    const navigate = useNavigate();

    const usernameRef = useRef(null);
    const passwordRef = useRef(null);
    const loginButtonRef = useRef(null);

    useEffect(() => {
        usernameRef.current.focus();
    }, []);

    const handleLogin = async (e) => {
        e.preventDefault();
        setMessage('');

        try {
            const response = await fetch('refactor/php/api/auth_api.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ nome: username, senha: password }),
            });

            const data = await response.json();

            if (response.ok) {
                setMessage(data.message);
                // Aqui você pode armazenar as informações do usuário/permissões no estado global ou localStorage
                console.log('User data:', data.user);
                // Redirecionar para uma página após o login, por exemplo, a dashboard
                // navigate('/dashboard');
            } else {
                setMessage(data.message);
            }
        } catch (error) {
            console.error('Erro na autenticação:', error);
            setMessage('Erro ao conectar com o servidor de autenticação.');
        }
    };

    const handleKeyDown = (e, nextRef) => {
        if (e.key === 'Enter' || e.key === 'ArrowDown') {
            e.preventDefault();
            nextRef.current.focus();
        } else if (e.key === 'ArrowUp') {
            e.preventDefault();
            // Implementar lógica para focar no campo anterior, se necessário
        }
    };

    return (
        <div className="senhas-container">
            <h2>Gerenciamento de Senhas</h2>
            <form onSubmit={handleLogin} className="senhas-form">
                <div className="form-group">
                    <label htmlFor="username">Usuário:</label>
                    <input
                        type="text"
                        id="username"
                        value={username}
                        onChange={(e) => setUsername(e.target.value)}
                        onKeyDown={(e) => handleKeyDown(e, passwordRef)}
                        ref={usernameRef}
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
                        onKeyDown={(e) => handleKeyDown(e, loginButtonRef)}
                        ref={passwordRef}
                        required
                    />
                </div>
                <button type="submit" ref={loginButtonRef}>Entrar</button>
            </form>
            {message && <p className="senhas-message">{message}</p>}
        </div>
    );
};

export default SenhasPage;