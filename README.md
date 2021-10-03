# Recon_url
recon_url is reconnaissance tool that fetch website urls and check the source code automatically without any interaction of the user and notify if the code has any error.This tool targets any website,api.

This is based on waybackurls and some scripts and it's currently under development

## Usage

1. download the code via `gitclone https://github.com/KarthickrajaU/recon_url.git`
2. give permission to executable in linux
  `chmod +x auto.sh`
3. then execute ~`./auto.sh`



## Why this tool?
   Well,this is tool is save your time to get websites all url and check whether the url is live or not (2xx,3xx,4xx) and finally do directory traversal attack and notify somehow the source leak any sensitive componsent.
    
    
## Note:
  You must manually added directory traversal payload list to do the recon process.
  I highly recommended use the seclist  wordlist on 
  ~ `gitclone https://github.com/danielmiessler/SecLists.git`
  
 
  You need waybackurls writtenby tomnomnom
  You can also check that on
  https://github.com/tomnomnom/waybackurls
  
## Warning:
Well this tool is under development crash may occur.
