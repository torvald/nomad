#!/bin/bash

# terraform fmt will not directly run on files without file type .tf and .tfvars

mkdir -p /tmp/terraform-fmt-backups/

for file in roles/nomad-jobs/files/*.nomad; do
    cp $file /tmp/terraform-fmt-backups/
    cp $file $file.tmp
    cat $file | terraform fmt - > $file.tmp
    if [ "$?" == "0" ]; then
        echo "$file OK"
        mv $file.tmp $file
    fi
done
