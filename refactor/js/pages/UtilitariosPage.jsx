import React, { useState } from 'react';
import axios from 'axios';
import { Container, Typography, TextField, Button, Box, Alert } from '@mui/material';

const UtilitariosPage = () => {
    const [dataLimite, setDataLimite] = useState('');
    const [message, setMessage] = useState('');
    const [error, setError] = useState('');

    const handleExcluirPedidos = async () => {
        if (!dataLimite) {
            setError('Por favor, informe a data limite.');
            return;
        }

        try {
            const response = await axios.post('/api/utilitarios/excluir-pedidos', { dataLimite });
            setMessage(response.data.message);
            setError('');
        } catch (err) {
            setError(err.response?.data?.message || 'Erro ao excluir pedidos.');
            setMessage('');
        }
    };

    const handleAbrirSenhas = () => {
        // Lógica para abrir o formulário de senhas (USenhas)
        // Isso pode envolver uma nova rota ou um modal
        setMessage('Funcionalidade de senhas ainda não implementada.');
        setError('');
    };

    return (
        <Container maxWidth="sm">
            <Box sx={{ my: 4 }}>
                <Typography variant="h4" component="h1" gutterBottom>
                    Utilitários
                </Typography>

                {message && <Alert severity="success" sx={{ mb: 2 }}>{message}</Alert>}
                {error && <Alert severity="error" sx={{ mb: 2 }}>{error}</Alert>}

                <Box sx={{ mb: 3 }}>
                    <Typography variant="h6" gutterBottom>
                        Excluir Pedidos Antigos
                    </Typography>
                    <TextField
                        label="Data Limite (DD/MM/AAAA)"
                        variant="outlined"
                        fullWidth
                        value={dataLimite}
                        onChange={(e) => setDataLimite(e.target.value)}
                        sx={{ mb: 2 }}
                    />
                    <Button
                        variant="contained"
                        color="primary"
                        onClick={handleExcluirPedidos}
                    >
                        Excluir Pedidos
                    </Button>
                </Box>

                <Box>
                    <Typography variant="h6" gutterBottom>
                        Gerenciar Senhas
                    </Typography>
                    <Button
                        variant="contained"
                        color="secondary"
                        onClick={handleAbrirSenhas}
                    >
                        Abrir Formulário de Senhas
                    </Button>
                </Box>
            </Box>
        </Container>
    );
};

export default UtilitariosPage;