# oss-review-toolkit

Ref: https://oss-review-toolkit.org/ort/docs/getting-started/tutorial

1. Prerequisities

---

- Windows(WSL must) / Linux / Mac
- Git (any recent version will do)
- Node.js 10.\* or higher.
- NPM 6.4.\* or higher.
- Yarn 1.9.\* or higher.

## Config Folder Structure

```
root@RAFIQUL:~# pwd
/root
   |_.ort
      |_config
	     |_conig.yml (ref: https://oss-review-toolkit.org/ort/docs/configuration/ort-yml)
		 |_license-classifications.yml

```

conig.yml

```
ort:
  # Force overwriting of any existing output files.
  forceOverwrite: true
  analyzer:
    allowDynamicVersions: true
```

license-classifications.yml

```
---
# Example license-classifications.yml based on categorization from
# https://github.com/aboutcode-org/scancode-toolkit/commit/ed644e4
#
# To demonstrate how one can insert a custom written offer
# include-source-code-offer-in-notice-file has been set to
# true for all licenses of the GPL family.
categories:
- name: "copyleft"
- name: "strong-copyleft"
- name: "copyleft-limited"
- name: "permissive"
  description: "Licenses with permissive obligations."
- name: "public-domain"
- name: "include-in-notice-file"
  description: >-
    This category is checked by templates used by the ORT report generator. The licenses associated with this
    category are included into NOTICE files.
- name: "include-source-code-offer-in-notice-file"
  description: >-
    A marker category that indicates that the licenses assigned to it require that the source code of the packages
    needs to be provided.

categorizations:
- id: "AGPL-1.0"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "AGPL-1.0-only"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "AGPL-1.0-or-later"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "AGPL-3.0"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "AGPL-3.0-only"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "AGPL-3.0-or-later"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "Apache-2.0"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "Artistic-1.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "Artistic-2.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "BSD-1-Clause"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "BSD-2-Clause"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "BSD-2-Clause-FreeBSD"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "BSD-2-Clause-NetBSD"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "BSD-3-Clause"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "BSD-4-Clause"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "BSD-4-Clause-UC"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "CC-BY-1.0"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "CC-BY-2.0"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "CC-BY-2.5"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "CC-BY-3.0"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "CC-BY-4.0"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "CC0-1.0"
  categories:
  - "public-domain"
  - "include-in-notice-file"
- id: "CDDL-1.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "CDDL-1.1"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "EPL-1.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "EPL-2.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "EUPL-1.1"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "EUPL-1.2"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "GPL-1.0+"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-1.0-only"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-1.0-or-later"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-2.0"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-2.0+"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-2.0-only"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-2.0-only WITH Classpath-exception-2.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-2.0-only WITH Font-exception-2.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-2.0-or-later"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-3.0"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-3.0+"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-3.0-only"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "GPL-3.0-or-later"
  categories:
  - "copyleft"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "JSON"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "LGPL-2.0-only"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "LGPL-2.0-or-later"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "LGPL-2.1-only"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "LGPL-2.1-or-later"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "LGPL-3.0-only"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "LGPL-3.0-or-later"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
  - "include-source-code-offer-in-notice-file"
- id: "Libpng"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "MIT"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "MIT-0"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "MIT-feh"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "MPL-1.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "MPL-1.1"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "MPL-2.0"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "MS-PL"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "MS-RL"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "ODbL-1.0"
  categories:
  - "copyleft"
  - "include-in-notice-file"
- id: "OFL-1.0"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "OFL-1.1"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "OpenSSL"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "PSF"
  categories:
  - "strong-copyleft"
  - "include-in-notice-file"
- id: "Python-2.0"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "Ruby"
  categories:
  - "copyleft-limited"
  - "include-in-notice-file"
- id: "SAX-PD"
  categories:
  - "public-domain"
  - "include-in-notice-file"
- id: "Unlicense"
  categories:
  - "public-domain"
  - "include-in-notice-file"
- id: "W3C"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "WTFPL"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "X11"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "Zlib"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "bzip2-1.0.5"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "bzip2-1.0.6"
  categories:
  - "permissive"
  - "include-in-notice-file"
- id: "curl"
  categories:
  - "permissive"
  - "include-in-notice-file"
```

## OSS Review Toolkit Folder Structure

```
mime-types (Testing Git Source Code)
   |_.ort.yml (added new file)
ort (OSS Review Toolkit Git Source Code)
output (Output Folder)
```

.ort.yml

```
analyzer:
  skip_excluded: true
excludes:
  scopes:
  - pattern: "devDependencies"
    reason: "DEV_DEPENDENCY_OF"
    comment: "Exclude devDependencies."
  - pattern: "node_modules/*"
    reason: "BUILD_TOOL_OF"
    comment: "Exclude node_modules."
```

## Install scancode-toolkit

```
git clone https://github.com/aboutcode-org/scancode-toolkit.git
cd scancode-toolkit
./configure
sudo ln -s /mnt/c/Users/Rafiq/Documents/OSS/scancode-toolkit/scancode /usr/local/bin/scancode
scancode -h
```

2. Download & Install ORT (Windows-WSL)

---

```
git clone --recurse-submodules https://github.com/oss-review-toolkit/ort.git
cd ort
./gradlew installDist

cli/build/install/ort/bin/ort --help
```

3. Testing

---

Testing repo: mime-types source code

```
git clone https://github.com/jshttp/mime-types.git [mime-types-dir]
cd [mime-types-dir]
git checkout 2.1.18
```

4. Run the analyzer on mime-types

---

```
# Command line help specific to the analyzer.
cli/build/install/ort/bin/ort analyze --help

# The easiest way to run the analyzer.
cli/build/install/ort/bin/ort analyze -i ./../mime-types -o ./../output -f JSON

```

5. Run the scanner

---

```
cli/build/install/ort/bin/ort scan --help
cli/build/install/ort/bin/ort -P ort.scanner.skipExcluded=true scan -i ./../output/analyzer-result.json -o ./../output -f JSON
```

6. Running the evaluator

---

```
cli/build/install/ort/bin/ort evaluate \
  --rules-file ./../evaluator.rules.kts \
  --license-classifications-file ./../license-classifications.yml \
  -i ./../output/scan-result.json \
  -o ./../output \
  -f JSON
```

7. Generate a report

---

```
cli/build/install/ort/bin/ort report \
  -f PlainTextTemplate,StaticHtml,WebApp,PdfTemplate,HtmlTemplate \
  -i ./../output/evaluation-result.json \
  -o ./../output
```
