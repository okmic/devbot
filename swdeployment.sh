pm2 kill devbot
git reset --hard HEAD
npm i
git pull origin main
git checkout main
cp prod.env .env 
npm run build
cp .env build/
pm2 start pm2-prod-config.json