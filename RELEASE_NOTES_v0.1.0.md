# OpLæs v0.1.0

Første offentlige macOS-release af OpLæs.

## Download

- `OpLaes-0.1.0-aarch64.dmg`

## Funktioner

- Rust + Tauri desktop-app (lille bundle)
- Dansk TTS for `TXT`, `MD`, `PDF`
- Stemmevalg og audio-eksport (`WAV` / `MP3`)
- Model-download ved første kørsel med fremskridt
- GGUF-modelvariant (`q8_0` / `q6_k`)

## Installation

1. Dobbeltklik DMG-filen.
2. Træk `OpLæs.app` til `Programmer`.
3. Start `OpLæs` fra `Programmer`.

### macOS Gatekeeper

Appen er ikke code-signed. macOS blokerer den ved første start.

1. Prøv at åbne `OpLæs` — klik **Done** i advarslen.
2. Åbn **Systemindstillinger** → **Anonymitet & sikkerhed**.
3. Scroll ned og klik **Åbn alligevel** (Open Anyway).
4. Bekræft med kodeord. Herefter starter appen normalt.

## Bemærkninger

- Model-filer downloades ved første kørsel fra Hugging Face.
- Model-attribution og licenser er inkluderet i appen og i `ATTRIBUTION.md`.

## Attribution

- Model: Plapre / Plapre Nano af syv.ai
- Kilde: https://github.com/syv-ai/plapre
- Licens: CC BY 4.0
- App: Roman Jurowetzki
