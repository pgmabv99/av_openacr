#!/bin/bash
mc alias remove x2s3
mc alias set x2s3 http://192.168.10.11:1624 minioadmin minioadmin 
mc ls x2s3
mc ls x2s3/avorovich
mc cp -r temp/collect_logs/rp/2025.08.07.11.34 x2s3/avorovich/
mc cp -r temp/collect_logs/rp/2025.08.07.11.24 x2s3/avorovich/
mc ls --recursive x2s3/avorovich/
mc rm -r  -force  x2s3/avorovich/
