echo "remove previous directory and any subdirectories without a warning prompt"
ssh yourusername@yourdomain.com 'rm -rf /var/www/html/yourpublishingdirectory'

echo "push new content into the remote directory"
scp -r -vrC ../mydoc_outputs/doc-writers yourusername@yourdomain:/var/www/html/yourpublishingdirectory

echo "All done pushing doc outputs to the server"

