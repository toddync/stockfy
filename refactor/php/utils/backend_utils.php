<?php

class BackendUtils {
    /**
     * Converte uma data no formato DD/MM/AAAA para o formato YYYY-MM-DD.
     * @param string $dateString A data no formato DD/MM/AAAA.
     * @return string A data no formato YYYY-MM-DD.
     */
    public static function convertDateFormat(string $dateString): string {
        return date('Y-m-d', strtotime(str_replace('/', '-', $dateString)));
    }

    /**
     * Valida se uma string é uma data válida no formato DD/MM/AAAA.
     * @param string $dateString A string a ser validada.
     * @return bool True se for uma data válida, false caso contrário.
     */
    public static function isValidDate(string $dateString): bool {
        $format = 'd/m/Y';
        $d = DateTime::createFromFormat($format, $dateString);
        return $d && $d->format($format) === $dateString;
    }

    // Adicione outras funções utilitárias de backend aqui conforme necessário
}

?>