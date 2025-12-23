import React from 'react';
import { useSeniorMode } from '../contexts/SeniorModeContext';
import Alerta from './Alerta';

interface PageLayoutProps {
    title: string;
    children: React.ReactNode;
    actions?: React.ReactNode;
    isLoading?: boolean;
    error?: string | null;
    success?: string | null;
    onErrorClose?: () => void;
    onSuccessClose?: () => void;
}

const PageLayout: React.FC<PageLayoutProps> = ({
    title,
    children,
    actions,
    isLoading,
    error,
    success,
    onErrorClose,
    onSuccessClose,
}) => {
    const { isSeniorMode } = useSeniorMode();

    return (
        <div className={`page-container p-6 bg-white shadow-md rounded-lg transition-all duration-300 relative ${isSeniorMode ? 'p-8' : 'p-6'}`}>

            {isLoading && (
                <div className="absolute inset-0 bg-white/80 z-50 flex justify-center items-center rounded-lg">
                    <div className={`flex flex-col items-center ${isSeniorMode ? 'text-2xl' : 'text-base'}`}>
                        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mb-4"></div>
                        <span className="text-gray-800 font-semibold">Carregando...</span>
                    </div>
                </div>
            )}

            {success && onSuccessClose && <Alerta message={success} onClose={onSuccessClose} />}
            {error && onErrorClose && <Alerta message={error} onClose={onErrorClose} />}

            <div className={`page-header flex justify-between items-center mb-6 ${isSeniorMode ? 'mb-10' : 'mb-6'}`}>
                <h1 className={`font-bold text-gray-800 ${isSeniorMode ? 'text-5xl' : 'text-3xl'}`}>
                    {title}
                </h1>
                <div className={`actions flex gap-4 ${isSeniorMode ? 'gap-6' : 'gap-4'}`}>
                    {actions}
                </div>
            </div>

            <div className={`page-content ${isSeniorMode ? 'text-xl leading-relaxed' : 'text-base'}`}>
                {children}
            </div>
        </div>
    );
};

export default PageLayout;
