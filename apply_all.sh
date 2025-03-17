#!bin/bash

#Initiate all directories that have and OpenTofu configuration files

MODULES=("ec2" "vcp" "alb")

for MODULE in "${MODULES[@]}"; do
    echo "Applying OpenTofu in @MODULE..."
    cd Infra-practice/@MODULE
    tofu init
    tofu apply -auto-approve
    cd ../..
done

echo "All OpenTofu configuration applied"