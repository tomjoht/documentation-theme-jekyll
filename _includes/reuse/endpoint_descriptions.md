| Endpoint | Description | Sample Java Code |
|-------|-------------|---------|
| {{matchdevice}} | Takes the incoming identifiers in the web request and looks to match those identifier values with any identifier values in existing profiles. The matching process is defined by the identifiers and rules configured in the ID service. If there is no match, a new profile is created.  | {{matchdevice_sample_code_java}} |
| {{multiscreening}} | Returns a list of all device profiles that contain a specific first-party identifier, such as a login ID.  | {{multiscreening_sample_code_java}} |
| {{household}} | Returns a list of all profiles containing a specific IP address identifier value.  | {{household_sample_code_java}} |
