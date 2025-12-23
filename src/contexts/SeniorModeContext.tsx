import React, { createContext, useContext, useState, useEffect, type ReactNode } from 'react';

interface SeniorModeContextType {
    isSeniorMode: boolean;
    toggleSeniorMode: () => void;
}

const SeniorModeContext = createContext<SeniorModeContextType | undefined>(undefined);

export const SeniorModeProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
    const [isSeniorMode, setIsSeniorMode] = useState(() => {
        const savedMode = localStorage.getItem('seniorMode');
        return savedMode === 'true';
    });

    useEffect(() => {
        localStorage.setItem('seniorMode', String(isSeniorMode));
        if (isSeniorMode) {
            document.documentElement.classList.add('senior-mode');
        } else {
            document.documentElement.classList.remove('senior-mode');
        }
    }, [isSeniorMode]);

    const toggleSeniorMode = () => {
        setIsSeniorMode(prev => !prev);
    };

    return (
        <SeniorModeContext.Provider value={{ isSeniorMode, toggleSeniorMode }}>
            {children}
        </SeniorModeContext.Provider>
    );
};

export const useSeniorMode = (): SeniorModeContextType => {
    const context = useContext(SeniorModeContext);
    if (!context) {
        throw new Error('useSeniorMode must be used within a SeniorModeProvider');
    }
    return context;
};
