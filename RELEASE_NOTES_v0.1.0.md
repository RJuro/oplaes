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

Appen er ikke code-signed. macOS vil advare ved første start.

**Højreklik-metode (nemmest):** Højreklik `OpLæs.app` i Programmer → vælg **Åbn** → klik **Åbn** i dialogen. Kun nødvendigt én gang.

**Terminal-metode (hvis du ser *"is damaged and can't be opened"*):**

```bash
xattr -cr /Applications/OpLæs.app
```

Eller fjern karantæne-flaget fra DMG-filen før montering:

```bash
xattr -cr ~/Downloads/OpLaes-0.1.0-aarch64.dmg
```

## Bemærkninger

- Model-filer downloades ved første kørsel fra Hugging Face.
- Model-attribution og licenser er inkluderet i appen og i `ATTRIBUTION.md`.

## Attribution

- Model: Plapre / Plapre Nano af syv.ai
- Kilde: https://github.com/syv-ai/plapre
- Licens: CC BY 4.0
- App: Roman Jurowetzki
