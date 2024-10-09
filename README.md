# OSS
##### ​Ref: https://oss-review-toolkit.org/ort/docs/getting-started/tutorial

Prerequisities
------------------
- Windows(WSL must) / Linux / Mac
- Git (any recent version will do)
- Node.js 10.* or higher.
- NPM 6.4.* or higher.
- Yarn 1.9.* or higher.
- Java 11
- Python3

Folder Structures
------------------
* ort
* mime-type
    * [.ort.yml](./mime-types/.ort.yml)
    * [package.json](./mime-types/package.json)
* output
* [evaluator.rules.kts](./evaluator.rules.kts)
* [license-classifications.yml](./license-classifications.yml)
​
Global configuration Folder Structure
---------------------------
```bash
cd ~/
```
* .ort
  * config
      * [config.yml](https://oss-review-toolkit.org/ort/docs/configuration/ort-yml)
      * [curations.yml](./curations.yml)
      * [license-classifications.yml](./license-classifications.yml)
		 
conig.yml
----------
```yml
ort:
   # Force overwriting of any existing output files.
   forceOverwrite: true
   analyzer:
     allowDynamicVersions: true
   ORT_AUTH_TOKEN: YOUR_TOKEN
   ORT_AUTH_USER: YOUR_USERNAME
   enableRepositoryPackageCurations: true
 
   scanner:
     config:
       ScanCode:
         options:
           commandLine: '--copyright --license --timeout 3600'
```
Setup curations
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
​
If these licenses are does not exist then add those.
```bash
"BSD License": BSD-3-Clause
"GNU GPLv2 (with FOSS License Exception)": GPL-2.0-only WITH Universal-FOSS-exception-1.0
```
After adding new license if it does  not work then search the similar license here then add it.
​
*ort/utils/spdx/build/resources/main/declared-license-mapping.yml*

Install scancode-toolkit
------------------------
```bash
cd ~/
git clone https://github.com/aboutcode-org/scancode-toolkit.git
cd scancode-toolkit
./configure
sudo ln -s ~/scancode-toolkit/scancode /usr/local/bin/scancode
scancode -h
```
​
Download & Install ORT (Windows-WSL)
----------------------------------------
​
```bash
git clone --recurse-submodules https://github.com/oss-review-toolkit/ort.git
cd ort
./gradlew installDist
​
cli/build/install/ort/bin/ort --help
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
​
# The easiest way to run the analyzer.
cli/build/install/ort/bin/ort analyze -i ./../mime-types -o ./../output -f JSON
​
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