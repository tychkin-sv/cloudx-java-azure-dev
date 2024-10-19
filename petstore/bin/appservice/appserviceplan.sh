# Function to create an Azure App Service Plan
# Usage ./bin/appserviceplan.sh
function create_app_service_plan() {
    local plan_name=$1
    local rg_name=$2
    local location=$3

    echo "Creating App Service Plan: $plan_name"
    az appservice plan create \
      --name "$plan_name" \
      --resource-group "$rg_name" \
      --location "$location" \
      --sku P1V2 \
      --is-linux \
      --output none
}

# Variables for Resource Group, Location, and App Service Plan name
RG_NAME="web_rg"
LOCATION="eastus"
ASP_NAME="asp-web-eastus"

# Calling the function to create the App Service Plan
create_app_service_plan "$ASP_NAME" "$RG_NAME" "$LOCATION"

LOCATION="eastus"
ASP_NAME="asp-api-eastus"
create_app_service_plan "$ASP_NAME" "$RG_NAME" "$LOCATION"

LOCATION="westeurope"
ASP_NAME="asp-web-westeurope"
create_app_service_plan "$ASP_NAME" "$RG_NAME" "$LOCATION"


