@echo ----------------------------------------------------------
cd "%~dp0"
copy "*.exe" "C:\Program Files\"
copy "*.ico" "C:\Program Files\"
copy "*.lnk" "C:\Documents and Settings\All Users\Start Menu\Programs\"
@echo ----------------------------------------------------------
@pause
@exit