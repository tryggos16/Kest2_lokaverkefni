$gogn = Import-Csv C:\Users\Tryggvi\Documents\kest_usersetup_csv_file.csv

foreach($data in $gogn) { 
    New-LocalUser -name $data.username -FullName $data.fullname -Password ($data.Password | ConvertTo-SecureString -AsPlainText -Force)
    Add-LocalGroupMember -Group $data.group -Member $data.username
    Add-LocalGroupMember -Group Allir -Member $data.username
}
 