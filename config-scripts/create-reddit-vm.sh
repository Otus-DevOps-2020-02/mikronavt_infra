#!/bin/bash
set -e

gcloud compute instances create reddit-full --boot-disk-size=12GB --image-family=reddit-full --machine-type=g1-small --tags=puma-server --restart-on-failure