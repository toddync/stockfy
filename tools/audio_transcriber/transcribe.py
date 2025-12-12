#!/usr/bin/env python3
"""
Transcritor de Áudio OGG para Texto
Usa Whisper (OpenAI) para transcrição offline e gratuita.
"""

import whisper
import sys
import os
from pathlib import Path

def transcribe_audio(audio_path: str, model_size: str = "base") -> str:
    """
    Transcreve um arquivo de áudio para texto.
    
    Args:
        audio_path: Caminho para o arquivo .ogg
        model_size: Tamanho do modelo Whisper (tiny, base, small, medium, large)
                   - tiny: mais rápido, menos preciso
                   - base: bom equilíbrio (recomendado)
                   - small/medium: mais preciso, mais lento
                   - large: melhor qualidade, requer mais RAM
    
    Returns:
        Texto transcrito do áudio
    """
    if not os.path.exists(audio_path):
        raise FileNotFoundError(f"Arquivo não encontrado: {audio_path}")
    
    print(f"Carregando modelo Whisper ({model_size})...")
    model = whisper.load_model(model_size)
    
    print(f"Transcrevendo: {audio_path}")
    result = model.transcribe(audio_path, language="pt")
    
    return result["text"]


def transcribe_folder(folder_path: str, model_size: str = "base") -> dict:
    """
    Transcreve todos os arquivos .ogg de uma pasta.
    
    Args:
        folder_path: Caminho para a pasta com arquivos .ogg
        model_size: Tamanho do modelo Whisper
    
    Returns:
        Dicionário {nome_arquivo: texto_transcrito}
    """
    folder = Path(folder_path)
    ogg_files = list(folder.glob("*.ogg")) + list(folder.glob("*.opus"))
    
    if not ogg_files:
        print(f"Nenhum arquivo .ogg encontrado em {folder_path}")
        return {}
    
    print(f"Encontrados {len(ogg_files)} arquivos de áudio")
    print(f"Carregando modelo Whisper ({model_size})...")
    model = whisper.load_model(model_size)
    
    transcriptions = {}
    for i, audio_file in enumerate(ogg_files, 1):
        print(f"\n[{i}/{len(ogg_files)}] Transcrevendo: {audio_file.name}")
        result = model.transcribe(str(audio_file), language="pt")
        transcriptions[audio_file.name] = result["text"]
        print(f"✓ Concluído")
    
    return transcriptions


def save_transcriptions(transcriptions: dict, output_file: str = "transcricoes.txt"):
    """Salva as transcrições em um arquivo de texto."""
    with open(output_file, "w", encoding="utf-8") as f:
        for filename, text in transcriptions.items():
            f.write(f"=== {filename} ===\n")
            f.write(f"{text}\n\n")
    print(f"\n📄 Transcrições salvas em: {output_file}")


def main():
    if len(sys.argv) < 2:
        print("Uso:")
        print("  python transcribe.py <arquivo.ogg>        # Transcreve um arquivo")
        print("  python transcribe.py <pasta>              # Transcreve todos .ogg da pasta")
        print("  python transcribe.py <pasta> --save       # Transcreve e salva em arquivo")
        sys.exit(1)
    
    path = sys.argv[1]
    save_to_file = "--save" in sys.argv
    
    if os.path.isfile(path):
        # Transcrever arquivo único
        text = transcribe_audio(path)
        print("\n" + "="*50)
        print("TRANSCRIÇÃO:")
        print("="*50)
        print(text)
        
    elif os.path.isdir(path):
        # Transcrever todos da pasta
        transcriptions = transcribe_folder(path)
        
        if transcriptions:
            print("\n" + "="*50)
            print("TRANSCRIÇÕES:")
            print("="*50)
            for filename, text in transcriptions.items():
                print(f"\n--- {filename} ---")
                print(text)
            
            if save_to_file:
                save_transcriptions(transcriptions)
    else:
        print(f"Erro: '{path}' não é um arquivo ou pasta válido")
        sys.exit(1)


if __name__ == "__main__":
    main()
