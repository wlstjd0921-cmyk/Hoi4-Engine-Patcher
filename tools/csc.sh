#!/usr/bin/env bash
set -e
REF="C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework/v4.8"
CSC="C:/Program Files/dotnet/sdk/9.0.302/Roslyn/bincore/csc.dll"
OUT="$1"; KIND="$2"; shift 2
OPTS=(); while [ "$1" != "--" ]; do OPTS+=("$1"); shift; done; shift
dotnet "$CSC" -nologo -noconfig -nostdlib+ -langversion:12 -deterministic -optimize+ -nullable:disable \
  -target:"$KIND" -platform:anycpu -out:"$OUT" \
  -r:"$REF/mscorlib.dll" -r:"$REF/System.dll" -r:"$REF/System.Core.dll" -r:"$REF/System.Drawing.dll" \
  -r:"$REF/System.Windows.Forms.dll" \
  "${OPTS[@]}" "$@"
