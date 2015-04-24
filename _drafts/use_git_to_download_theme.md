 Using iTerm, create the directory where you want to install the project. I like using ~[username]/projects, because ~[username] is the default directory that appears when you open iTerm on a Mac. 
    
    ```
    cd projects
    mkdir acme
    cd acme
    ```
    
2. Once you're inside the folder for your project (for example, acme), type `git clone https://github.com/tomjohnson1492/documentation-theme-jekyll.git .` (The ` .` means to clone the github repo into the current directory. Make sure the directory is empty before cloning the theme in there.)
3. In your new project folder, remove the .git folder, because no doubt you'll be customizing this project's content and committing it to another revision control repository.