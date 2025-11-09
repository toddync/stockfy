import React, { useState, FormEvent } from 'react';
import { useNavigate } from 'react-router-dom';

const LoginPage: React.FC = () => {
    const [username, setUsername] = useState<string>('');
    const [password, setPassword] = useState<string>('');
    const [message, setMessage] = useState<string>('');
    const navigate = useNavigate();

    const handleLogin = async (event: FormEvent) => {
        event.preventDefault();
        setMessage('');

        // Mock API call
        if (username === 'admin' && password === 'admin') {
            setMessage('Login bem-sucedido!');
            console.log('User data:', { user: { nome: 'admin' } });
            // Redirect to a dashboard or another page
            navigate('/manutped');
        } else {
            setMessage('Nome de usuário ou senha inválidos.');
        }
    };

    return (
        <div className="bg-gray-100 flex justify-center items-center min-h-screen">
            <div className="bg-white p-10 rounded-lg shadow-lg text-center w-full max-w-sm">
                <div className="w-24 h-24 bg-gray-300 rounded-full mx-auto mb-5 flex items-center justify-center">
                    <span className="text-gray-500">Logo</span>
                </div>
                <h2 className="mb-5 text-2xl font-bold text-gray-800">Login</h2>
                <form onSubmit={handleLogin}>
                    <div className="mb-4 text-left">
                        <label htmlFor="username" className="block mb-1 text-gray-600 font-bold">Usuário:</label>
                        <input
                            type="text"
                            id="username"
                            value={username}
                            onChange={(e) => setUsername(e.target.value)}
                            className="w-full px-4 py-2 border border-gray-300 rounded-md text-base focus:outline-none focus:ring-2 focus:ring-blue-500"
                            required
                        />
                    </div>
                    <div className="mb-6 text-left">
                        <label htmlFor="password" className="block mb-1 text-gray-600 font-bold">Senha:</label>
                        <input
                            type="password"
                            id="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            className="w-full px-4 py-2 border border-gray-300 rounded-md text-base focus:outline-none focus:ring-2 focus:ring-blue-500"
                            required
                        />
                    </div>
                    <button 
                        type="submit" 
                        className="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-3 px-5 rounded-md text-base transition duration-300 ease-in-out"
                    >
                        Entrar
                    </button>
                </form>
                {message && <p className="mt-5 text-red-500 font-bold">{message}</p>}
            </div>
        </div>
    );
}

export default LoginPage;