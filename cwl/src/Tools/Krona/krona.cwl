#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: Krona

#edited from ebi-metagenomics-cwl/tools/krona.cwl
#hints:
#  DockerRequirement:
#    dockerPull: kronav2.7.1:1.0

requirements:
  InlineJavascriptRequirement: {}

baseCommand: ["ktImportText"]

inputs:
  otu_counts:
    type: File
    label: Tab-delimited text file
    inputBinding:
      position: 2


arguments:
  - "-o"
  - $( inputs.otu_counts.nameroot + "_krona.html" )

outputs:
  krona_html:
    type: File
    format: edam:format_2331
    outputBinding:
      glob: "*.html"

$namespaces:
 edam: http://edamontology.org/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/docs/schemaorg.owl

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder:
    - name: "EMBL - European Bioinformatics Institute"
    - url: "https://www.ebi.ac.uk/"