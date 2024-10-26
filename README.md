# OSS
##### Ref: https://oss-review-toolkit.org/ort/docs/getting-started/tutorial

Prerequisities
------------------
- [Windows(WSL dev container)]

Folder structures
---------------------
* OSS-REVIEW-TOOLKIT
    * 📁.devcontainer
        * [config.sh](.devcontainer/config.sh)
        * [devcontainer.json](.devcontainer/devcontainer.json)
        * [install_java.sh](.devcontainer/install_java.sh)
        * [oss.sh](.devcontainer/oss.sh)
        * [requirements.oss.txt](.devcontainer/requirements.oss.txt)
    * mime-type
        * [.ort.yml](./mime-types/.ort.yml)
        * [package.json](./mime-types/package.json)
    * [📝evaluator.rules.kts](./evaluator.rules.kts)
    * [📝license-classifications.yml](./license-classifications.yml)
    * [README.md](README.md)
    * [.gitignore](.gitignore)

Clone OSS-REVIEW-TOOLKIT Repository
----------------------------------------
```bash
git clone https://github.com/mrafiq709/oss-review-toolkit.git
```

Testing
----------
Testing repo: mime-types source code
```bash
git clone https://github.com/jshttp/mime-types.git [mime-types-dir]
cd [mime-types-dir]
git checkout 2.1.18
```
Run the analyzer on mime-types
---------------------------------
```bash
cd ort
# Command line help specific to the analyzer.
cli/build/install/ort/bin/ort analyze --help

# The easiest way to run the analyzer.
cli/build/install/ort/bin/ort analyze -i ./../mime-types -o ./../output -f JSON

```
Run the scanner
--------------------
```bash
cli/build/install/ort/bin/ort scan --help
cli/build/install/ort/bin/ort -P ort.scanner.skipExcluded=true scan -i ./../output/analyzer-result.json -o ./../output -f JSON
```
Running the evaluator
--------------------------
```bash
cli/build/install/ort/bin/ort evaluate \
  --rules-file ./../evaluator.rules.kts \
  --license-classifications-file ./../license-classifications.yml \
  -i ./../output/scan-result.json \
  -o ./../output \
  -f JSON
```
Generate a report
---------------------
```bash
cli/build/install/ort/bin/ort report \
  -f PlainTextTemplate,StaticHtml,WebApp,PdfTemplate,HtmlTemplate \
  -i ./../output/evaluation-result.json \
  -o ./../output
```
NOTE
----------------
Why curations ?

If you see in *analyzer-result*
```json
"declared_licenses_processed" : {
    "unmapped" : [ "BSD License" ]
}
```
Then you have to declare the License to see it in the scan report.
	  
Check declared license
-----------------------
***ort/utils/spdx/src/main/resources/declared-license-mapping.yml***

If these licenses are does not exist then add those.
```bash
"BSD License": BSD-3-Clause
"GNU GPLv2 (with FOSS License Exception)": GPL-2.0-only WITH Universal-FOSS-exception-1.0
```
After adding new license if it does  not work then search the similar license here then add it.

*ort/utils/spdx/build/resources/main/declared-license-mapping.yml*