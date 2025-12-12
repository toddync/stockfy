# Transcritor de Áudio OGG → Texto

Programa Python para transcrever áudios .ogg (WhatsApp) para texto usando Whisper.

## Instalação (Arch Linux)

```bash
# Instalar ffmpeg (necessário para processar áudio)
sudo pacman -S ffmpeg

# Criar ambiente virtual
python -m venv venv

# Ativar venv (fish shell)
source venv/bin/activate.fish
# OU para bash/zsh:
# source venv/bin/activate

# Instalar dependências
pip install -r requirements.txt
```

### Alternativa sem ativar venv

```bash
./venv/bin/pip install -r requirements.txt
./venv/bin/python transcribe.py audio.ogg
```

## Uso

```bash
# Transcrever um arquivo
python transcribe.py audio.ogg

# Transcrever todos os áudios de uma pasta
python transcribe.py ./audios/

# Transcrever e salvar em arquivo
python transcribe.py ./audios/ --save
```

## Modelos Whisper

O modelo padrão é `base`. Para alterar, edite o script:

| Modelo | Tamanho | RAM Requerida | Velocidade   |
| ------ | ------- | ------------- | ------------ |
| tiny   | 39M     | ~1GB          | Muito rápido |
| base   | 74M     | ~1GB          | Rápido       |
| small  | 244M    | ~2GB          | Médio        |
| medium | 769M    | ~5GB          | Lento        |
| large  | 1550M   | ~10GB         | Muito lento  |

## Dica

Coloque os áudios do cliente na pasta `audios/` e execute:

```bash
python transcribe.py ./audios/ --save
```

As transcrições serão salvas em `transcricoes.txt`.
