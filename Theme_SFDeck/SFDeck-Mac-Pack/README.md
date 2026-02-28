# SF Deck Theme (macOS)

Pacote macOS do tema SF Deck para Ulanzi Deck.

## Conteúdo
- `System/` (ícones/actions do sistema tematizados)
- `ProfilesV2/78f5630f-af07-40ba-b55c-0ea9922e08fe.ulanziProfile/` (default offline profile tematizado)

## Instalação (macOS)
1. Feche o app Ulanzi Deck.
2. Execute `./install.sh` a partir desta pasta.
3. Abra o app Ulanzi Deck novamente.

## Comportamento de instalação
- `System/` é substituído pelo tema SF Deck.
- `ProfilesV2/` funciona em modo merge:
  - profiles que já existem no usuário são preservados.
  - profiles do pack que não existem no usuário são adicionados.

## Observações
- Este pack é **macOS-only**.
- Não contém paths Windows (`C:/...`, `AppData`, etc.).
