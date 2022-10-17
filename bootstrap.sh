#!/bin/bash
curl -sLS https://get.arkade.dev | sudo sh
arkade get kubectl helm terraform kind
sudo mv ~/.arkade/bin/* /usr/local/bin/
sudo terraform apply -auto-approve