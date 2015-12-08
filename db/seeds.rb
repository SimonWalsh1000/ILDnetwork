# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




countries = [["Andorra", "AD"], ["United Arab Emirates", "AE"], ["Afghanistan", "AF"], ["Antigua and Barbuda", "AG"], ["Anguilla", "AI"], ["Albania", "AL"], ["Armenia", "AM"], ["Netherlands Antilles", "AN"], ["Angola", "AO"], ["Antarctica", "AQ"], ["Argentina", "AR"], ["American Samoa", "AS"], ["Austria", "AT"], ["Australia", "AU"], ["Aruba", "AW"], ["Åland Islands", "AX"], ["Azerbaijan", "AZ"], ["Bosnia and Herzegovina", "BA"], ["Barbados", "BB"], ["Bangladesh", "BD"], ["Belgium", "BE"], ["Burkina Faso", "BF"], ["Bulgaria", "BG"], ["Bahrain", "BH"], ["Burundi", "BI"], ["Benin", "BJ"], ["Saint Barthélemy", "BL"], ["Bermuda", "BM"], ["Brunei Darussalam", "BN"], ["Bolivia", "BO"], ["Bonaire, Sint Eustatius and Saba", "BQ"], ["Brazil", "BR"], ["Bahamas", "BS"], ["Bhutan", "BT"], ["Bouvet Island", "BV"], ["Botswana", "BW"], ["Belarus", "BY"], ["Belize", "BZ"], ["Canada", "CA"], ["Cocos (Keeling) Islands", "CC"], ["Congo, The Democratic Republic Of The", "CD"], ["Central African Republic", "CF"], ["Congo", "CG"], ["Switzerland", "CH"], ["Côte D'Ivoire", "CI"], ["Cook Islands", "CK"], ["Chile", "CL"], ["Cameroon", "CM"], ["China", "CN"], ["Colombia", "CO"], ["Costa Rica", "CR"], ["Cuba", "CU"], ["Cape Verde", "CV"], ["Curaçao", "CW"], ["Christmas Island", "CX"], ["Cyprus", "CY"], ["Czech Republic", "CZ"], ["Germany", "DE"], ["Djibouti", "DJ"], ["Denmark", "DK"], ["Dominica", "DM"], ["Dominican Republic", "DO"], ["Algeria", "DZ"], ["Ecuador", "EC"], ["Estonia", "EE"], ["Egypt", "EG"], ["Western Sahara", "EH"], ["Eritrea", "ER"], ["Spain", "ES"], ["Ethiopia", "ET"], ["Finland", "FI"], ["Fiji", "FJ"], ["Falkland Islands (Malvinas)", "FK"], ["Micronesia, Federated States Of", "FM"], ["Faroe Islands", "FO"], ["France", "FR"], ["Gabon", "GA"], ["United Kingdom", "GB"], ["Grenada", "GD"], ["Georgia", "GE"], ["French Guiana", "GF"], ["Guernsey", "GG"], ["Ghana", "GH"], ["Gibraltar", "GI"], ["Greenland", "GL"], ["Gambia", "GM"], ["Guinea", "GN"], ["Guadeloupe", "GP"], ["Equatorial Guinea", "GQ"], ["Greece", "GR"], ["South Georgia and the South Sandwich Islands", "GS"], ["Guatemala", "GT"], ["Guam", "GU"], ["Guinea-Bissau", "GW"], ["Guyana", "GY"], ["Hong Kong", "HK"], ["Heard and McDonald Islands", "HM"], ["Honduras", "HN"], ["Croatia", "HR"], ["Haiti", "HT"], ["Hungary", "HU"], ["Indonesia", "ID"], ["Ireland", "IE"], ["Israel", "IL"], ["Isle of Man", "IM"], ["India", "IN"], ["British Indian Ocean Territory", "IO"], ["Iraq", "IQ"], ["Iran, Islamic Republic Of", "IR"], ["Iceland", "IS"], ["Italy", "IT"], ["Jersey", "JE"], ["Jamaica", "JM"], ["Jordan", "JO"], ["Japan", "JP"], ["Kenya", "KE"], ["Kyrgyzstan", "KG"], ["Cambodia", "KH"], ["Kiribati", "KI"], ["Comoros", "KM"], ["Saint Kitts And Nevis", "KN"], ["Korea, Democratic People's Republic Of", "KP"], ["Korea, Republic of", "KR"], ["Kuwait", "KW"], ["Cayman Islands", "KY"], ["Kazakhstan", "KZ"], ["Lao People's Democratic Republic", "LA"], ["Lebanon", "LB"], ["Saint Lucia", "LC"], ["Liechtenstein", "LI"], ["Sri Lanka", "LK"], ["Liberia", "LR"], ["Lesotho", "LS"], ["Lithuania", "LT"], ["Luxembourg", "LU"], ["Latvia", "LV"], ["Libya", "LY"], ["Morocco", "MA"], ["Monaco", "MC"], ["Moldova, Republic of", "MD"], ["Montenegro", "ME"], ["Saint Martin", "MF"], ["Madagascar", "MG"], ["Marshall Islands", "MH"], ["Macedonia, the Former Yugoslav Republic Of", "MK"], ["Mali", "ML"], ["Myanmar", "MM"], ["Mongolia", "MN"], ["Macao", "MO"], ["Northern Mariana Islands", "MP"], ["Martinique", "MQ"], ["Mauritania", "MR"], ["Montserrat", "MS"], ["Malta", "MT"], ["Mauritius", "MU"], ["Maldives", "MV"], ["Malawi", "MW"], ["Mexico", "MX"], ["Malaysia", "MY"], ["Mozambique", "MZ"], ["Namibia", "NA"], ["New Caledonia", "NC"], ["Niger", "NE"], ["Norfolk Island", "NF"], ["Nigeria", "NG"], ["Nicaragua", "NI"], ["Netherlands", "NL"], ["Norway", "NO"], ["Nepal", "NP"], ["Nauru", "NR"], ["Niue", "NU"], ["New Zealand", "NZ"], ["Oman", "OM"], ["Panama", "PA"], ["Peru", "PE"], ["French Polynesia", "PF"], ["Papua New Guinea", "PG"], ["Philippines", "PH"], ["Pakistan", "PK"], ["Poland", "PL"], ["Saint Pierre And Miquelon", "PM"], ["Pitcairn", "PN"], ["Puerto Rico", "PR"], ["Palestine, State of", "PS"], ["Portugal", "PT"], ["Palau", "PW"], ["Paraguay", "PY"], ["Qatar", "QA"], ["Réunion", "RE"], ["Romania", "RO"], ["Serbia", "RS"], ["Russian Federation", "RU"], ["Rwanda", "RW"], ["Saudi Arabia", "SA"], ["Solomon Islands", "SB"], ["Seychelles", "SC"], ["Sudan", "SD"], ["Sweden", "SE"], ["Singapore", "SG"], ["Saint Helena", "SH"], ["Slovenia", "SI"], ["Svalbard And Jan Mayen", "SJ"], ["Slovakia", "SK"], ["Sierra Leone", "SL"], ["San Marino", "SM"], ["Senegal", "SN"], ["Somalia", "SO"], ["Suriname", "SR"], ["South Sudan", "SS"], ["Sao Tome and Principe", "ST"], ["El Salvador", "SV"], ["Sint Maarten", "SX"], ["Syrian Arab Republic", "SY"], ["Swaziland", "SZ"], ["Turks and Caicos Islands", "TC"], ["Chad", "TD"], ["French Southern Territories", "TF"], ["Togo", "TG"], ["Thailand", "TH"], ["Tajikistan", "TJ"], ["Tokelau", "TK"], ["Timor-Leste", "TL"], ["Turkmenistan", "TM"], ["Tunisia", "TN"], ["Tonga", "TO"], ["Turkey", "TR"], ["Trinidad and Tobago", "TT"], ["Tuvalu", "TV"], ["Taiwan, Republic Of China", "TW"], ["Tanzania, United Republic of", "TZ"], ["Ukraine", "UA"], ["Uganda", "UG"], ["United States Minor Outlying Islands", "UM"], ["United States", "US"], ["Uruguay", "UY"], ["Uzbekistan", "UZ"], ["Holy See (Vatican City State)", "VA"], ["Saint Vincent And The Grenedines", "VC"], ["Venezuela, Bolivarian Republic of", "VE"], ["Virgin Islands, British", "VG"], ["Virgin Islands, U.S.", "VI"], ["Vietnam", "VN"], ["Vanuatu", "VU"], ["Wallis and Futuna", "WF"], ["Samoa", "WS"], ["Yemen", "YE"], ["Mayotte", "YT"], ["South Africa", "ZA"], ["Zambia", "ZM"], ["Zimbabwe", "ZW"]]


100.times do |n|
    index = rand(0..100)
    country = countries[index][0]
    iso = countries[index][1]
    params = { :member => {
        :email => "example-#{n+1700101}@example.org",
        :password => "fidelio",
        :password_confirmation => "fidelio",
      }
    }

    member = Member.create!(params[:member])

    user = member.user

      schedule = [ "Daily", "Weekly", "Fortnightly", "Monthly", "Every 2 months", "Every 3 months", "Less frequently than every 3 months"]


    params = { :user => {
        :institute_type => "University College Hospital",
        :country => country,
        :iso => iso,
        :nonild =>10,
        :ipfpatients => 20,
        :hppatients => 30,
        :sarcoidpatients => 10,
        :specialist => "MDT",
        :iippatients => 10,
        :ctdpatients =>10,
        :unclasspatients => 10,
        :institute => "ILD institute",
        :schedule => schedule[rand(0..6)],
        :experience => 3,
        :kind => "Something",
        :practice => rand(1..3),
        :biopsy => 10,
        :cryobiopsy => "no",
        :other => 0,
        :document => "yes",
        :ipf => "10-20",
        :institute_type => "Academic",
        :ipf => rand(0..40),
        :cases => rand(0..100)
      }
    }

    user.update!(params[:user])


end


