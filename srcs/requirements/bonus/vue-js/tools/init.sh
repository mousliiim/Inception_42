#!/bin/sh

if ! netstat -tuln | grep ":4848 " > /dev/null
then
  echo "Y" | vue create . --default;
  rm /var/www/static-site/src/components/HelloWorld.vue
  cp /var/HelloWorld.vue /var/www/static-site/src/components
  npm run serve -- --port 4848;
else
  echo "Un serveur npm est déjà en cours d'exécution sur le port 4848. Aucune action nécessaire."
fi