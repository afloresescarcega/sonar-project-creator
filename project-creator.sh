#!/bin/bash
export PROJECT_NAME=$(echo "$(basename "$PWD")$(openssl rand -hex 2)")
export PROJECT_KEY=$(echo "$(basename "$PWD")$(openssl rand -hex 2) hehe" | tr " " "-")

curl --location "https://$SONAR_HOST/api/projects/create" \
--header "Authorization: Bearer $SONAR_TOKEN" \
--form 'name="'"$PROJECT_NAME"'"' \
--form 'newCodeDefinitionType="days"' \
--form 'newCodeDefinitionValue="30"' \
--form 'organization="'"$ORG_KEY"'"' \
--form 'project="'"$PROJECT_KEY"'"' \
--form 'visibility="public"'

./gradlew sonar -Dsonar.projectKey=$PROJECT_KEY