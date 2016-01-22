---
layout: endpoint
---
swagger: '2.0'
info:
  title: Resolve API
  version: 1.3.0
  # contact:
  #   name: Experian Resolve Team — Documentation
  #   email: ditechcomm@the41st.com
  description: >
    Resolve groups together different identifiers (for example, a cookie, DeviceInsight ID, email, and IP address) under the umbrella of a single "device profile." Before submitting requests, you must configure Resolve with the identifiers and rules you want. The server has already been pre-configured with the following identifiers and rules.
    <div class="alert alert-success" role="alert"><i class="fa fa-info-circle"></i> <b>Tip: </b>See the <a href="http://docs.the41.internal/resolve/fe/resolve/res_tutorial_getting_started.html" style="text-decoration: underline;" target="_blank">Getting Started Tutorial</a> in the documentation for instructions on submitting requests with each endpoint.</div>
    <div class="alert alert-warning" role="alert"><i class="fa fa-info-circle"></i> <b>Note: </b>The Experian network blocks requests to AWS testing domains. Before clicking "Try it out!", switch to another network.</div>

    <div class="container">
    <div class="apiConfigDetails">
    <button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#demo">
    <span class="glyphicon glyphicon-collapse-down"></span> See API Configuration Details
    </button>
    <div id="demo" class="collapse">
      
    <h2>Identifiers Allowed</h2>
    
    <p>Based on this configuration, Resolve will accept any of the following identifiers in requests.</p>
    
    <table class="table">
    <thead>
    <tr>
    <th>Identifier Codes</th>
    <th>Data Type</th>
    <th>Comparison Method</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td><code>cookieAlpha</code></td>
    <td>string</td>
    <td>EXACT MATCH</td>
    </tr>
    <tr>
    <td><code>cookieBeta</code></td>
    <td>string</td>
    <td>EXACT MATCH</td>
    </tr>
    <tr>
    <td><code>email+userAgent</code></td>
    <td>string</td>
    <td>EXACT MATCH</td>
    </tr>
    <tr>
    <td><code>diidIsolated</code></td>
    <td>string</td>
    <td>EXACT MATCH</td>
    </tr>
    <tr>
    <td><code>diidUniversal</code></td>
    <td>string</td>
    <td>EXACT MATCH</td>
    </tr>
    <tr>
    <td><code>ipv4</code></td>
    <td>string</td>
    <td>EXACT MATCH</td>
    </tr>
    <tr>
    <td><code>email</code></td>
    <td>string</td>
    <td>EXACT MATCH</td>
    </tr>
    <tr>
    <td><code>userAgent</code></td>
    <td>string</td>
    <td>EXACT MATCH</td>
    </tr>
    <tr>
    <td><code>jsc</code></td>
    <td>string</td>
    <td>—</td>
    </tr>
    <tr>
    <td><code>httpHeaders</code></td>
    <td>string</td>
    <td>—</td>
    </tr>
    </tbody>
    </table>
      
    <h2>Matchdevice Rules</h2>
    
    <p>Here are the rules the Resolve API server is configured to process. Note that only the first 5 identifiers are configured in rules.</p>
        
    
    <table class="table">
    <thead>
    <tr>
    <th>Rules</th>
    <th>Priority</th>
    <th>Hits per day</th>
    <th>Time</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td><code>cookieAlpha</code></td>
    <td>1</td>
    <td>—</td>
    <td>—</td>
    </tr>
    <tr>
    <td><code>cookieBeta</code></td>
    <td>2</td>
    <td>—</td>
    <td>—</td>
    </tr>
    <tr>
    <td><code>email+userAgent</code></td>
    <td>3</td>
    <td>—</td>
    <td>—</td>
    </tr>
    <tr>
    <td><code>diidIsolated</code></td>
    <td>4</td>
    <td>—</td>
    <td>—</td>
    </tr>
    <tr>
    <td><code>diidUniversal</code></td>
    <td>5</td>
    <td>—</td>
    <td>—</td>
    </tr>
    </tbody>
    </table>
    
    <h2>Group Rules</h2>
        
    <p>Resolve will create group IDs when the following are submitted in requests.</p>
             
    
    <table class="table">
    <thead>
    <tr>
    <th>Group type</th>
    <th>Identifier</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td>Multiscreening</td>
    <td><code>email</code></td>
    </tr>
    <tr>
    <td>Householding</td>
    <td><code>ipv4</code></td>
    </tr>
    </tbody>
    </table>
    
    <h2>Authorization Information</h2>
        
    <p>A button next to the Authorization parameter in each endpoint section helps you generate this value. Authorization headers expire after 5 minutes.</p>
    
    <table class="table">
    <thead>
    <tr>
    <th>Codes</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td>client ID </td>
    <td>95128</td>
    </tr>
    <tr>
    <td>secret</td>
    <td>resolve41</td>
    </tr>
    </tbody>
    </table>
        
    </div>
    </div>
    </div>
host: 52.5.74.221

securityDefinitions:
  hmac:
    type: "apiKey"
    in: "header"
    name: "Authorization"


samplelink: '{{site.data.mydoc.mydoc_urls.mydoc_getting_started.link}}'
samplelinktoo: hello
security:
  -
    hmac: []
schemes:
- http
consumes:
- application/json
produces:
- application/json
paths:
   service/matchdevice:
     post:
       summary: Matchdevice Endpoint
       description: Looks to find a match for the inbound dentification data to a device profile using device matching rules. If there is a match, the matched profile gets returned. Otherwise a new profile is created.
       operationId: matchDevice
       tags: matchdevice
       security:
         - hmac: []
       parameters:
       - name: Authorization
         in: header
         description: The message in the HMAC authorization header is the request epoch time plus the current epoch time. <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#matchdevice">Generate Authorization</button>
         required: true
         type: string

       - name: body
         in: body
         description: Contains the identifiers you want to submit to Resolve to look for matches.
         required: true
         schema:
           "$ref": "#/definitions/matchdevice object"
       tags:
         - matchdevice
       responses:
         200:
           description: Matches the identifiers in the request with identifiers in existing profiles. If there is a match, the matched profile gets returned. If there is no match, a new profile is created. The following response shows the response returned when verbose is set to `true`.
           schema:
             $ref: "#/definitions/Matchdevice Response"
           examples:
             application/json: |-
                {
                  "id": "5c455eaf-01cd-4f80-8276-e4e4723fd37c",
                  "ld": {
                    "diidIsolated": "E77747204A6B883210A2CEFD6AAC74A9AD70EE0A",
                    "ipv4": "194.66.82.11",
                    "diidUniversal": "E77747204A6B883210A2CEFD6AAC74A9AD70EE0A",
                    "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36",
                    "cookieAlpha": "xyz",
                    "email": "jdoe@gmail.com",
                    "cookieBeta": "abc"
                  },
                  "pr": {
                    "DNT": {
                      "cv": "FALSE",
                      "au": {
                        "1449708": "FALSE"
                      }
                    }
                  }
                }


   ":1117/idtranslation/group/{type}":
     post:
       summary: Idtranslation Group Endpoint
       description: Returns details about profiles that contain a specific identifier.
       operationId: group request
       tags:
         - idtranslation
       security:
         - hmac: []
       parameters:
       - name: Authorization
         in: header
         description: The message in the HMAC authorization header must contain all the identifier values arranged adjacent to each other in the same order as they appear in the request. <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#group">Generate Authorization</button>

         required: true
         type: string

       - name: type
         in: path
         description: Determines the type of grouping (multiscreening or householding) you are interested in. If it's an IP address, use `HH`. If it's any other type of identifier, use `MS`.
         required: true
         type: string

       - name: body
         in: body
         description: The Idtranslation Group request body parameters, as shown in the Model Schema to the right. Click Model to see descriptions of each parameter.
         required: true
         schema:
           "$ref": "#/definitions/group object"
       responses:
         200:
           description: |-
             In this sample response, because `verbose` is set to `true`, the identifer history (`ih`) is included. Additionally, the `outputidentifiers` parameter is set to `email`, so `email` is the only identifier listed in the last ID array (`ld`) and identifier history (`ih`).
           schema:
             $ref: "#/definitions/Group Response"
           examples:
             application/json: |-

                {
                  "groupDetails": {
                    "email": {
                      "jdoe@gmail.com": [
                        {
                          "dp": {
                            "id": "e019805b-636e-4712-af61-95d878100768",
                            "ld": {
                              "email": "jdoe@gmail.com"
                            },
                            "ih": {
                              "email": {
                                "cd": "email",
                                "it": "FIRSTPARTYID",
                                "sz": 1,
                                "ls": {
                                  "jdoe@gmail.com": {
                                    "vl": "jdoe@gmail.com",
                                    "hc": 1,
                                    "fs": 1449865,
                                    "ls": 1449865
                                  }
                                }
                              }
                            },
                            "pr": {
                              "DNT": {
                                "cv": "FALSE",
                                "au": {
                                  "1449865": "FALSE"
                                }
                              }
                            }
                          },
                          "lgid": "9115367e-b718-4907-be83-fdb00b220d84"
                        },
                        {
                          "dp": {
                            "id": "5c455eaf-01cd-4f80-8276-e4e4723fd37c",
                            "ld": {
                              "email": "jdoe@gmail.com"
                            },
                            "ih": {
                              "email": {
                                "cd": "email",
                                "it": "FIRSTPARTYID",
                                "sz": 1,
                                "ls": {
                                  "jdoe@gmail.com": {
                                    "vl": "jdoe@gmail.com",
                                    "hc": 10,
                                    "fs": 1449708,
                                    "ls": 1449869
                                  }
                                }
                              }
                            },
                            "pr": {
                              "DNT": {
                                "cv": "FALSE",
                                "au": {
                                  "1449710": "FALSE",
                                  "1449869": "FALSE"
                                }
                              }
                            }
                          },
                          "lgid": "9115367e-b718-4907-be83-fdb00b220d84"
                        }
                      ]
                    }
                  }
                }

         400:
           description: Bad request
         401:
           description: Unauthorized
         404:
           description: Not found
         402:
           description: Unprocessable entity
         500:
           description: Internal server error

   ":1117/idtranslation/devices/{groupid}/client/{client}":
    get:
      summary: Idtranslation Devices Endpoint
      description: Returns all profiles that contain a specific group ID.
      operationId: devices request
      tags:
        - idtranslation
      security:
        - hmac: []
      parameters:

        - name: Authorization
          in: header
          description: The message for this endpoint must contain the group ID + current epoch time. <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#devices">Generate Authorization</button>
          required: true
          type: string

        - name: groupid
          in: path
          description: The group ID that is used to look up the profile IDs.
          required: true
          type: string

        - name: client
          in: path
          description: The client code.
          required: true
          type: string

        - name: filter
          in: query
          description: "Allowed values are `LD` or `ALL`. `LD` (the default value) stands for last ID array. `LD` Filters the response to include only the identifiers in the profile's last ID array (the most recently seen identifier values of each identifier type). `ALL` includes the profile ID, the identifiers in the last ID array, and the identifiers in the identifier history (`ih`)."
          required: false
          type: string

        - name: code
          in: query
          description: Limits the response to include only the identifier code specified. Only one identifier code is allowed.
          required: false
          type: string

      responses:
         200:
           description: |-
             In this sample response, the `filter` parameter is set to `LD` so that only the last ID array is included (not the full identifier history). Additionally, the `code` parameter is left blank so that all identifiers are included in the response, not just a specific identifier.
           schema:
             $ref: "#/definitions/Devices Response"
           examples:
             application/json: |-
                {
                  "devices": {
                    "5c455eaf-01cd-4f80-8276-e4e4723fd37c": {
                      "ld": {
                        "diidIsolated": "E77747204A6B883210A2CEFD6AAC74A9AD70EE0A",
                        "ipv4": "194.66.82.11",
                        "diidUniversal": "E77747204A6B883210A2CEFD6AAC74A9AD70EE0A",
                        "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36",
                        "cookieAlpha": "xyz",
                        "email": "jdoe@gmail.com",
                        "cookieBeta": "abc"
                      }
                    },
                    "e019805b-636e-4712-af61-95d878100768": {
                      "ld": {
                        "cookieAlpha": "2349zz",
                        "email": "jdoe@gmail.com"
                      }
                    }
                  }
                }
         400:
           description: Bad request
         401:
           description: Unauthorized
         404:
           description: Not found
         402:
           description: Unprocessable entity
         500:
           description: Internal server error

   ":1117/idtranslation/identifiers/{deviceid}/client/{client}":
     get:
      summary: Idtranslation Identifiers Endpoint
      description: Returns all identifiers for a specific profile. Profiles contain all the identifiers that have been matched to that profile based on the rules configured in the ID service. This endpoint provides a way to list all the identifiers for a specific profile.

      tags:
        - idtranslation
      security:
        - hmac: []
      parameters:

        - name: Authorization
          in: header
          description: The message attributes for the idtranslation/group endpoint must contain the profile ID + current epoch time.  <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#identifiers">Generate Authorization</button>
          required: true
          type: string

        - name: deviceid
          in: path
          description: The profile ID that is used to look up the group ID.
          required: true
          type: string

        - name: client
          in: path
          description: The client code. Although you include this in the Authorization header already, it is still needed by this endpoint.
          required: true
          type: string

        - name: filter
          in: query
          description: The only allowed value here is `ld`, which stands for last ID array. This option filters the response to include only the identifiers in the profile's last ID array (the most recently seen identifier values of each identifier type). Without this filter, you will see all identifiers associated with a profile.
          required: false
          type: string

        - name: code
          in: query
          description: Limits the response to include only the identifier code specified. The identifier code is the Code value specified in the identifier configuration in the ID service. For example, if the identifier key-value pair is `cookieAlpha`&#58; `123456789`, the identifier code is just `cookieAlpha`. Comma-separated values aren't allowed, so you can have just one identifier here.
          required: false
          type: string
      responses:
        200:
           description: |-
             In this sample response, the `filter` parameter is set to `ld` so that only the values in the last ID array are included. No `code` parameter was specified, so all identifiers are included.
           schema:
             $ref: "#/definitions/Identifiers Response"
           examples:
             application/json: |-
                {
                  "ld": {
                    "diidIsolated": "E77747204A6B883210A2CEFD6AAC74A9AD70EE0A",
                    "ipv4": "194.66.82.11",
                    "diidUniversal": "E77747204A6B883210A2CEFD6AAC74A9AD70EE0A",
                    "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36",
                    "cookieAlpha": "xyz",
                    "email": "jdoe@gmail.com",
                    "cookieBeta": "abc"
                  }
                }
        400:
          description: Bad request
        401:
          description: Unauthorized
        404:
          description: Not found
        402:
          description: Unprocessable entity
        500:
          description: Internal server error

   ":1117/idtranslation/groupdetails/{deviceid}/client/{client}":
    get:
      summary: Idtranslation Groupdetails Endpoint
      description: Returns group details (group ID, group history, and other profiles that also contain the group ID) for a specific profile.
      operationId: groupdetails request
      tags:
        - idtranslation
      security:
        - hmac: []
      parameters:

        - name: Authorization
          in: header
          description: The message in the HMAC authorization header must include profile ID + current epoch time. <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#groupdetails">Generate Authorization</button>
          required: true
          type: string

        - name: deviceid
          in: path
          description: The profile ID that is used to look up the group details.
          required: true
          type: string

        - name: client
          in: path
          description: The client code.
          required: true
          type: string

        - name: grouptype
          in: query
          description: "Allowed values are `HH` or `MS`. `HH` stands for householding, `MS` for multiscreening. To get the group IDs related to householding rules, use `HH`. To get the group IDs related to multiscreening rules, use `MS`."
          required: false
          type: string

        - name: filter
          in: query
          description: "The only allowed value is `lgid`, which stands for last group ID. This option filters the response to include only the last group ID. Without this filter, you will see all the group IDs associated with a profile. Having multiple group IDs is more common with householding scenarios."
          required: false
          type: string

        - name: includeotherdevices
          in: query
          description: "Allowed values are `true` or `false`. When you submit a profile ID in your request, the response returns the group ID for the profile. If you want the response to return a list of other profiles that also contain the group ID, set the includeotherdevices parameter to true. The other profiles that contain the group ID will be listed in a devices object in the response."
          required: false
          type: string

      responses:
         200:
           description: |-
             In this sample response, the `grouptype` is `MS` because it's a multiscreening group. The `filter` parameter is left blank, so all group IDs associated with the profile are shown (not just the last group ID). The `includeotherdevices` parameter is set to `true`. This means any other profiles that also contain the group ID are included in the response, not just the profile ID submitted in the request.
           schema:
             $ref: "#/definitions/GroupDetails Response"
           examples:
             application/json: |-
                {
                  "gids": {
                    "MS": {
                      "lgid": "9115367e-b718-4907-be83-fdb00b220d84",
                      "devices": [
                        "9a6a51b0-e828-4f6d-aed3-d90c5fc0d632",
                        "e019805b-636e-4712-af61-95d878100768"
                      ]
                    }
                  }
                }
         400:
           description: Bad request
         401:
           description: Unauthorized
         404:
           description: Not found
         402:
           description: Unprocessable entity
         500:
           description: Internal server error


definitions:

  matchdevice object:
    type: object
    required:
    - time
    - inputIds
    - clientId
    properties:
      inputIds:
        type: object
        description: The identifiers for the device. Can be any identifier type from the list of identifiers set up in Mission Control.
        "$ref": "#/definitions/inputIds object"
      time:
        description: The time the web request was submitted. Must be within 5 minutes of the real Epoch time in the Authorization header. The format must be in Epoch time in seconds (10 digits)
        type: string
        example: "1444670381"

      verbose:
        description: The amount of detail to include in the REST response. Options are `true`, `false`, or `testing`. This is a string, not a Boolean
        type: string
        example: "true"

      clientId:
        description: The client ID, which is used to define the table in the database where the profiles are stored
        type: string
        example: "95128"


      httpHeaders:
        type: object
        description: The HTTP headers for the web request. If present, these values are included in the algorithm to create a DeviceInsight ID. You can include as many headers as you want; the example just shows four header properties.
        "$ref": "#/definitions/httpHeaders object"

      privacy:
        type: array
        description: The privacy object contains an array that contains an object with two key-value pairs&#58; `privacyType` and `value`
        items:
          "$ref": "#/definitions/privacy object"

  inputIds object: #matchdevice object
    type: object
    properties:
      cookieAlpha:
        type: string
        example: xyz
        description: The identifier Code and value. 
      cookieBeta:
        type: string
        example: abc
        description: The identifier Code and value. 
      jsc:
        type: string
        example: "0a44j1cclY5BNvcKyAdMUDFBpBeA0fUm7qKFz0Xnj3wMvsD7z5meTuCUMz_WMXkfoBUs_43wuZPup_nH2t05oaYAhrcpMxE6DBUr5xj6KktELraceYLOHypZHgfLMC7AeLd7FmrpwoNN5uQ4s5uQ3Q9cAxw63QuyPB94UXuGlfUm7qKFz0Xnj3wMvsD7z5meTuCUMz_WMXkfoBUs_43wuZPup_nH2t05oaYAhrcpMxE6DBUr5xj6KktELraceYLOHypZHgfLMC7Awvw0BpRMPSB6MeQhVARgCa3hb95n2qjftckuyPBDjaY2ftckkCoq1HACVcHaHKGNI.95y2fR0odm_dhrxbuJjkWxv5iJ7LDoA4manN_n_nHDuXr2pN1dVdIV6970rTdyJny3rjNpp0iJ7LDg8fg9HBQLz4mvmfTT9oaSumKkpjlRiwerbXh8bUtILzQW6TjJvDOhhMETcouU.UyMDMC9mKlCjtxTdqRnQPiTxGdotzwZJRMQEjiCEkNzLvRSz_vjPSnur9mt.yzYEzpJckQPiIhgjeHNDSw6bzSwezcmoz5Rz4NhzelQttyUshugcCdDvurOaiy2UnpXM3IvIIE0HlByrkFJEnYbQhrb_GGEOpBSGpUPSbB5qfXlAmjJvDOhhM4XM0oGN_tvfvCSnBNl_uY5BNnOmqw24thxDvsFTyNpje70xHbupyJjxBPNSuy.91C"
      email:
        type: string
        example: jdoe@gmail.com
      ipv4:
        type: string
        example: 194.66.82.11

  httpHeaders object: #matchdevice object
    type: object
    properties:
      user-agent:
        type: string
        example: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36"
      accept:
        type: string
        example: "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
      accept-language:
        type: string
        example: "en-US,en;q=0.8"
      accept-encoding:
        type: string
        example: "gzip,deflate"


  privacy object: #matchdevice object
    type: object
    properties:
      privacyType:
        type: string
        example: DNT
        description: Available values for privacyType include DNT, IOS, or PC (referring to "Do not Track", Apple, or "Privacy Choice"). The value is case insensitive.
      value:
       example: false
       type: string
       description: The values for value depend on the privacyType. For DNT and PC, the values can be true or false (with or without quotes). For IOS, the values can be enabled, disabled, or undefined.

  group object:
    type: object
    required:
    - identifiers
    properties:
      identifiers:
        description: The list of identifiers that you want to use to look up other identifiers. To look up multiple values for the same identifier, use a comma-separated list in the value for values as shown in the example
        type: object
        "$ref": "#/definitions/group identifiers object"

      noOfDevices:
        description: The number of device profiles sent back in the response. The default is all available devices
        type: integer
        format: int32
        example: 10

      verbose:
        description: Whether the response should include verbose details or not. Setting verbose mode to true includes the last ID array (ld), identifier history (ih), and group IDs (lgid) in the response. The identifier history includes all the previous identifier values included in the profile. The default value is false.
        type: boolean
        example: true

      translation:
        description: This option tells the ID service which database tables to look in for the information, speeding up the request. If using an identifier that is defined in a group rule set, use INDEX. If using any other type of identifier, use `GROUP`. Format in full caps. The default is `INDEX`. Use FULL CAPS.
        type: string
        example: INDEX

      outputIdentifiers:
        description: If only certain ID types are required in the response, include the ID codes as comma separated values (for example, `idCode1,idCode2`). Setting the output identifiers allows you to restrict the output to a specific type of identifiers. The value for the output identifiers is the Code name of the identifier that you used when creating the identifier. The default identifiers returned are all identifiers.
        type: string
        example: "email"

  group identifiers object: #group object
    type: array
    items:
      "$ref": "#/definitions/identifiers list"

  identifiers list:
    type: object
    properties:
      identifier:
        type: string
        description: The identifier Code (the key in the key-value pair)
        example: "email"
      values:
        type: string
        description: The value for the identifier (the value in the key-value pair)
        example: "jdoe@gmail.com"

  Matchdevice Response:
    type: object
    properties:
      id:
        type: string
        description: TAn ID generated from the ID Generation service, representing the consolidated identification data assets for either a specific device or household.
      ld:
        type: object
        description: Last ID array. This is an array that keeps the last seen value for each type of identifier (one entry per identifier type being tracked). As matches are made against the profile, the last ID value for each type is retained in this list. Each entry in the last ID list follows a &lt;key&#58; value&gt; pair format. The key is the Code value for the identifier. The value is the identifier value, that is, the actual ID that was last seen for this identifier.
        "$ref": "#/definitions/ld object"
      pr:
        type: object
        description: Privacy preferences for the user. The first item in the privacy object is the privacy type. There are three options&#58; <code>IOS</code> (apple privacy), <code>PC</code> (Android privacy choice), and <code>DNT</code> (do not track). Each of those options can have two sub-items&#58; <code>au</code> (audit) and <code>cv</code> (content value). The system can be configured to store multiple privacy preferences.
        "$ref": "#/definitions/pr object"
  ld object:
    type: object
    "$ref": "#/definitions/tracking details object"

  pr object:
    type: object
    "$ref": "#/definitions/tracking details object"


  tracking details object:
    type: object
    description: track
    properties:
      cv:
        type: string
        example: cv
        description: Content value. The value of the privacy preference.
      au:
        type: string
        example: 888
        description: Audit. The timestamp of when the privacy preference was received.
        "$ref": "#/definitions/audit number object"

  audit number object:
    type: string
    description: last id array


  Group Response:
    type: object
    properties:
      groupDetails:
        type: object
        description: description of inputIds
        "$ref": "#/definitions/groupDetails object"



  groupDetails object:
    type: object
    description: The groupDetails object lists out each of the identifiers submitted in the request. Each identifier contains an array listing all the values for each identifier.
    properties:
      identifier:
        type: object
        "$ref": "#/definitions/groupIdentifier"


  groupIdentifier:
    type: array
    description: An identifier in the response.
    items:
      properties:
        dp:
          type: object
          "$ref": "#/definitions/device profile object"
        lgid:
          type: string
          example: Last group ID. This ID represents the group ID value for a specific group type. The <i>last</i> descriptor means that the ID is the most recently seen group ID (the last one seen) in the profile.


  device profile object:
    type: string
    properties:
      dp:
        type: object
        "$ref": "#/definitions/dp object"

  dp object:
    type: string
    description: Device profile.
    properties:
      id:
        title: id
        type: string
        description: ID. The device profile ID.
      ld:
        title: last ID array
        type: string
        description: Last ID array. This is an array that keeps the last seen value for each type of identifier (one entry per identifier type being tracked). As matches are made against the profile, the last ID value for each type is retained in this list. Each entry in the last ID list follows a &lt;key&#58; value&gt; pair format. The key is the Code value for the identifier. The value is the identifier value, that is, the actual ID that was last seen for this identifier.
      ih:
        title: identifier history
        type: object
        description: Identifier history. A history of each ID that has been attached to the profile is kept. It is configurable as to how many IDs are kept for each type. The number of IDs kept will be a balance of space and processing time to manage the ID lists and how they improve overall match rates. Each entry in the list will have the following fields&#58; <code>cd</code>, <code>it</code>, <code>sz</code>, <code>ls</code>. In the case of householding, the <code>ih</code> is a map that contains a list of IP addresses that have been seen on this Id.

  Identifiers Response:
    type: object
    properties:
      ld:
        type: object
        "$ref": "#/definitions/Response ld object"
      ih:
        type: object
        description: The identifier history for the profile
        "$ref": "#/definitions/Response ih object"

  Response ld object:
    type: object
    properties:
      identifier:
        type: string
        description: Last ID array. This is an array that keeps the last seen value for each type of identifier (one entry per identifier type being tracked). As matches are made against the profile, the last ID value for each type is retained in this list. Each entry in the last ID list follows a &lt;key&#58; value&gt; pair format. The key is the Code value for the identifier. The value is the identifier value, that is, the actual ID that was last seen for this identifier.

  Response ih object:
    type: object
    properties:
      identifier:
        type: string
        description: Identifier history. A history of each ID that has been attached to the profile is kept. It is configurable as to how many IDs are kept for each type. The number of IDs kept will be a balance of space and processing time to manage the ID lists and how they improve overall match rates. Each entry in the list will have the following fields&#58; <code>cd</code>, <code>it</code>, <code>sz</code>, <code>ls</code>. In the case of householding, the <code>ih</code> is a map that contains a list of IP addresses that have been seen on this Id.
        "$ref": "#/definitions/Response identifier object"

  Response identifier object:
    type: object
    properties:
      cd:
        type: string
        description: Code. The "Code" value for the Identifier Type.
      it:
        type: string
        description: Identifier type. The type of identifier, such as first-party or cookie.
      sz:
        type: string
        description: Size. The number of IDs that are currently in history for this ID. Once this limit is hit, the oldest ID is aged out of the list.
      ls:
        type: object
        description: List. The list of values for this identifier that Resolve is keeping track of.
        "$ref": "#/definitions/ls object"

  ls object:
    type: object
    properties:
      ls identifier:
        type: object
        "$ref": "#/definitions/ls object properties"

  ls object properties:
    type: object
    properties:
      vl:
        type: string
        description: Value. The actual ID.
      hc:
        type: string
        description: Hit count. The number of of times this identifier was included in a request that was matched to that device profile. Upon creation of the profile, the hit count is set to 1.
      fs:
        type: string
        description: First seen. The timestamp within a request for a device seen for the first time. The time is stored in UTC / Java Epoch format.
      ls:
        type: string
        description: Last seen. The timestamp within a request for a device seen the last time. The time is stored in UTC / Java Epoch format.

  GroupDetails Response:
    type: object
    properties:
      gids:
        type: object
        description: Group IDs. When you create a group rule, you specify a householding or multiscreening identifier for the ID service to look for. When the householding or multiscreening identifier appears in requests, the ID service creates a group ID based on this identifier. When the ID service assigns the householding or multiscreening identifier to a profile, the group ID gets assigned to the same profile. Group IDs are a way that you establish groups across profiles.
        "$ref": "#/definitions/gids object"

  gids object:
    type: object
    properties:
      HH:
        type: object
        "$ref": "#/definitions/HH object"
      MS:
        type: object
        "$ref": "#/definitions/MS object"

  HH object:
    type: object
    description: Householding. Refers to householding group rules that you set up in Mission Control.
    properties:
      lgid:
        type: string
        description: Last group ID. This ID represents the group ID value for a specific group type. The <i>last</i> descriptor means that the ID is the most recently seen group ID (the last one seen) in the profile.
      gidhl:
        type: string
        description: Group ID history. The most recent group ID is stored in the <code>lgid</code> (last group ID). Each time Resolve receives a request containing a unique value for either an identifier configured in the multiscreening or householding rules, a new group ID gets created. In addition to the last group ID (<code>lgid</code>), the other group IDs are stored in a group ID history (<code>gidhl</code>). If you set the Max Group ID Threshold to 50, it means that 1 group ID can be stored in the <code>lgid</code>, and 49 can be stored in the <code>gidhl</code>. If ID service receives another group ID, it takes the place of the <code>lgid</code> value. The previous <code>lgid</code> value moves down to the <code>gidhl</code>, and the last <code>gidhl</code> gets removed.

      devices:
        type: string
        description: A list of profile IDs. Usually this key is used inside a list of group IDs that list out all the devices (or profiles) that contain the same group ID.

  MS object:
    type: object
    description: Multiscreening. Refers to multiscreening group rules that you set up in Mission Control.
    properties:
      lgid:
        type: string
        description: Last group ID. This ID represents the group ID value for a specific group type. The <i>last</i> descriptor means that the ID is the most recently seen group ID (the last one seen) in the profile.
      gidhl:
        type: string
        description: Group ID history. The most recent group ID is stored in the <code>lgid</code> (last group ID). Each time Resolve receives a request containing a unique value for either an identifier configured in the multiscreening or householding rules, a new group ID gets created. In addition to the last group ID (<code>lgid</code>), the other group IDs are stored in a group ID history (<code>gidhl</code>). If you set the Max Group ID Threshold to 50, it means that 1 group ID can be stored in the <code>lgid</code>, and 49 can be stored in the <code>gidhl</code>. If ID service receives another group ID, it takes the place of the <code>lgid</code> value. The previous <code>lgid</code> value moves down to the <code>gidhl</code>, and the last <code>gidhl</code> gets removed.

      devices:
        type: string
        description: A list of profile IDs. Usually this key is used inside a list of group IDs that list out all the devices (or profiles) that contain the same group ID.

  Devices Response:
    type: object
    description: A list of the profile IDs, formatted as an array.
    properties:
      deviceids:
        "$ref": "#/definitions/deviceids"
  
  deviceids:
    type: array
    items:
      type: string

---


