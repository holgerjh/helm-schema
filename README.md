# Helm Plugin for Schema Generation

This is a plugin for helm that adds the `helm schema` command.

## Demo

![demo](https://github.com/holgerjh/helm-schema/blob/main/demo.svg?raw=true)

## Installation

* Run `helm plugin install https://github.com/holgerjh/helm-schema`.

* Run `helm schema`. It should output a help.

## Usage

### Schema Creation

The syntax to create a JSON Schema from files FILE-1 ... FILE-N is:

`helm schema create FILE-1 [-f FILE-2] [-f ...] [-f FILE-N] [-o OUTPUT-FILE]`.

To create a schema from a chart with a single values.yaml: 

`helm schema create values.yaml -o values.schema.json`

To create a schema from a chart with multiple yaml files: 

`helm schema create values.yaml -f my-other-values.yaml -o values.schema.json`

#### Options

The following options are available:

| Option                  | Description                                |
| ----------------------- | ------------------------------------------ |
| `-a`, `--allow-additional`  | Generates a schema that allows unknown object properties that were not encountered during schema generation. Useful for generating a schema from an incomplete `values.yaml`. Default: false |
| `-f`, `--file stringArray`  | Additional file that will be merged into main file before creating the schema. Can be specified mulitple times. |
| `-h`, `--help`              | help for create |
| `-d`, `--id string`         | Fill the schema $id field. |
| `-m`, `--merge-only`        | Do not generate a schema. Instead, output the YAML result of the merge operation. Default: false |
| `-o`, `--output string`     | Output file. Default is STDOUT. |
| `-r`, `--require-all`       | Generates a strict schema that requires all keys to be present. Default: false |

### Schema Verification

Verify the newly generated schema against the chart: `helm lint .`

## Restrictions

Currently only linux is supported.

## Uninstall

Run `helm plugin uninstall schema`.
