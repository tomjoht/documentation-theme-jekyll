| Abbreviation | Description
|--------------|-----------|--------|
| id | The profile ID. |
| ld | A list of identifiers — one entry per identifier type being tracked. As matches are made against the profile, the last ID value for each type is retained in this list. Each entry in the last ID list follows a <key: value> pair format. The key is the Code value for the identifier. The value is the identifier value, that is, the actual ID that was last seen for this identifier.|
| pr | Privacy preferences for the user. The first item in the privacy object is the privacy type. There are three options: `IOS` (apple privacy), `PC` (android privacy), and `DNT` (do not track). <br><br>Each of those options can have two sub-items: `au` (audit) and `cv` (content value.) Audit is the timestamp when the privacy preference was received, and the content value is the value of that privacy preference. The system can be configured to store multiple privacy preferences.|
