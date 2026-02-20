<p align="center">
  <img src="icon.png" width="128" height="128" alt="OpLæs">
</p>

<h1 align="center">OpLæs</h1>

<p align="center">
  Dansk tekst-til-tale desktop-app bygget med Rust og Tauri.
</p>

---

## Hvad er OpLæs?

OpLæs konverterer tekstfiler til naturlig dansk tale direkte på din Mac. Appen bruger [Plapre TTS](https://syv.ai/viden/plapre)-modellerne fra syv.ai og kører helt lokalt -- ingen cloud-tjeneste, ingen konto.

**Understøttede formater:** PDF, TXT, Markdown

**Eksporterer:** WAV og MP3

## Download

Hent den nyeste macOS-version fra GitHub Releases:

> [**Seneste release**](https://github.com/RJuro/oplaes/releases/latest)

Filnavn: `OpLaes-0.1.0-aarch64.dmg`

## Installation

1. Download `.dmg`-filen fra Releases.
2. Dobbeltklik for at mounte.
3. Træk `OpLæs.app` til `Programmer`.
4. Start appen fra `Programmer`.

### macOS Gatekeeper

Appen er ikke code-signed med et Apple Developer-certifikat. macOS vil blokere den ved første start med beskeden *"Apple could not verify…"*.

**Sådan åbner du appen:**

1. Prøv at åbne `OpLæs` — macOS blokerer den. Klik **Done**.
2. Åbn **Systemindstillinger** → **Anonymitet & sikkerhed** (Privacy & Security).
3. Scroll ned — der står at OpLæs blev blokeret. Klik **Åbn alligevel** (Open Anyway).
4. Bekræft med dit kodeord. Herefter starter appen normalt hver gang.

## Første kørsel

Ved første start downloader OpLæs de nødvendige model-filer fra Hugging Face og gemmer dem lokalt. Du kan vælge mellem to varianter:

| Variant | Beskrivelse |
|---------|-------------|
| **Q8_0** | Bedste kvalitet, større download |
| **Q6_K** | Mindre model, hurtigere load |

Filerne hentes fra [`syvai/plapre-nano`](https://huggingface.co/syvai) og caches i appens data-mappe.

## Stemmer

| Stemme | Anbefalet |
|--------|-----------|
| **Tor** | Ja |
| **Ida** | Ja |
| Liv | |
| Ask | |
| Kaj | |

## Byg lokalt

```bash
cd app
npm install
npm run tauri -- build --bundles app
cd ..
./scripts/make_drag_dmg.sh
```

## Attribution

- **Model:** Plapre / Plapre Nano af [syv.ai](https://syv.ai/viden/plapre)
- **Model-kilde:** [GitHub](https://github.com/syv-ai/plapre) / [Hugging Face](https://huggingface.co/syvai)
- **Model-licens:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

Se [`ATTRIBUTION.md`](app/src-tauri/ATTRIBUTION.md) for den fulde attribution-tekst.

## Licens

- App-kode: MIT
- Model-assets: CC BY 4.0

## Forfatter

Roman Jurowetzki
