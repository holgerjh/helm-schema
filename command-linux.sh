#!/bin/bash
export GENSCHEMA_BINARY_NAME="helm schema"

show_hint() {
  echo ""
  echo "Hint: To create a schema for the current chart use:"
  echo "      $GENSCHEMA_BINARY_NAME create values.yaml -o values.schema.json"
  echo ""

}

$HELM_PLUGIN_DIR/genjsonschema-cli "$@" 

if [ ! "$@" ] ; then
  show_hint
fi
