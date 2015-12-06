# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  specialist      :boolean
#  experience      :integer
#  institute       :string
#  radiologist     :boolean
#  pathologist     :boolean
#  schedule        :string
#  cases           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  member_id       :integer
#  country         :string
#  ipf             :integer
#  nurse           :boolean
#  genetics        :boolean
#  physio          :boolean
#  rheum           :boolean
#  ipfpatients     :integer
#  sarcoidpatients :integer
#  IIPpatients     :integer
#  CTDpatients     :integer
#  unclasspatients :integer
#

class User < ActiveRecord::Base

  belongs_to :member

  has_many :paths

  has_many :others

  has_many :rheumatologists

  has_many :rads

  has_many :physicians

  accepts_nested_attributes_for :rheumatologists, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :others, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :physicians, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :rads, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :paths, reject_if: :all_blank, allow_destroy: true

  before_save :country_name

  validate :user_practice, :on => :update

  validate :user_role, :on => :update

  validate :user_experience, :on => :update

  validate :user_institution, :on => :update

  validate :user_institution_type, :on => :update

  validate :user_specialist, :on => :update

  validate :disease_proportions, :on => :update

  validate :user_specialist, :on => :update

  validate :user_cases, :on => :update

  validate :user_ipf, :on => :update

  validate :user_biopsy, :on => :update

  validate :user_cryobiopsy, :on => :update

  validate :user_nonild, :on => :update

  validate :user_ipfpatients, :on => :update

  validate :user_hppatients, :on => :update

  validate :user_sarcoidpatients, :on => :update

  validate :user_iippatients, :on => :update

  validate :user_ctdpatients, :on => :update

  validate :user_unclasspatients, :on => :update

  validate :user_other, :on => :update


  def user_practice
    errors.add(:base, 'You need to answer question A."How do you diagnose IPF?"') if self.practice.nil?
  end

  def user_role
    errors.add(:base, 'You need to answer Section B."Which best describes your role?"') if self.kind.blank?
  end

  def user_experience
    errors.add(:base, 'You need to answer Section B."How many years experience do you have in this role?"') if self.experience.nil?
  end

  def user_institution
    errors.add(:base, 'You need to answer Section B."What is the name of your institution?"') if self.institute.blank?
  end

  def user_institution_type
    errors.add(:base, 'You need to answer Section B."What type of institution is this?"') if self.institute_type.blank?
  end

  def user_specialist
    errors.add(:base, 'You need to answer Section C."Which best describes your MDT meeting?"') if self.specialist.blank?
  end

  def user_cases
    errors.add(:base, 'You need to answer Section D."Number of new cases of ILD per month (approx)?"') if self.cases.blank?
  end

  def user_ipf
    errors.add(:base, 'You need to answer Section D."Number of new cases of IPF per month (approx)"') if self.ipf.blank?
  end

  def user_biopsy
    errors.add(:base, 'You need to answer Section D."Percentage of patients biopsied (approx)"') if self.biopsy.blank?
  end

  def user_cryobiopsy
    errors.add(:base, 'You need to answer Section D."Availability of cryobiopsy"') if self.cryobiopsy.blank?
  end

  def user_nonild
    errors.add(:base, 'You need to answer Section D."Proportion of non-ILD patients (0 if you see none)"') if self.nonild.blank?
  end

  def user_iippatients
    errors.add(:base, 'You need to answer Section D."Proportion of non-IPF IIP patients (0 if you see none)"') if self.iippatients.blank?
  end

  def user_ipfpatients
    errors.add(:base, 'You need to answer Section D."Proportion of IPF patients (0 if you see none)"') if self.ipfpatients.blank?
  end

  def user_hppatients
    errors.add(:base, 'You need to answer Section D."Proportion of HP patients (0 if you see none)"') if self.hppatients.blank?
  end

  def user_sarcoidpatients
    errors.add(:base, 'You need to answer Section D."Proportion of sarcoidosis patients (0 if you see none)"') if self.sarcoidpatients.blank?
  end

  def user_ctdpatients
    errors.add(:base, 'You need to answer Section D."Proportion of CTD-ILD patients (0 if you see none)"') if self.ctdpatients.blank?
  end

  def user_unclasspatients
    errors.add(:base, 'You need to answer Section D."Proportion of unclassifiable ILD patients (0 if you see none)"') if self.unclasspatients.blank?
  end

  def user_other
    errors.add(:base, 'You need to answer Section D."Proportion of other patients (select 0 if not applicable)"') if self.other.blank?
  end







  def practice_to_string
    if self.practice == "1"
      'By myself with the aid of diagnostic guidelines'
    elsif self.practice == "2"
      'Via a face-to-face MDT discussion'
    elsif self.practice == "3"
      'Through referral to an expert/academic ILD centre'
    end
  end

  def disease_proportions
    disease_array = [ self.nonild, self.ipfpatients, self.hppatients, self.sarcoidpatients, self.iippatients, self.ctdpatients, self.unclasspatients, self.other]
    compact_disease_array = disease_array.compact
    compact_disease_array.inject{|sum,x| sum + x } == 100 ? true : errors.add(:base, 'Section D. Disease proportions must add up to 100%')
  end

  def country_name
    if self.country.present?
      if self.country.length < 3
        iso = self.country
        code = self.country.to_s
        country_array =  [["Andorra", "AD"], ["United Arab Emirates", "AE"], ["Afghanistan", "AF"], ["Antigua and Barbuda", "AG"], ["Anguilla", "AI"], ["Albania", "AL"], ["Armenia", "AM"], ["Netherlands Antilles", "AN"], ["Angola", "AO"], ["Antarctica", "AQ"], ["Argentina", "AR"], ["American Samoa", "AS"], ["Austria", "AT"], ["Australia", "AU"], ["Aruba", "AW"], ["Åland Islands", "AX"], ["Azerbaijan", "AZ"], ["Bosnia and Herzegovina", "BA"], ["Barbados", "BB"], ["Bangladesh", "BD"], ["Belgium", "BE"], ["Burkina Faso", "BF"], ["Bulgaria", "BG"], ["Bahrain", "BH"], ["Burundi", "BI"], ["Benin", "BJ"], ["Saint Barthélemy", "BL"], ["Bermuda", "BM"], ["Brunei Darussalam", "BN"], ["Bolivia", "BO"], ["Bonaire, Sint Eustatius and Saba", "BQ"], ["Brazil", "BR"], ["Bahamas", "BS"], ["Bhutan", "BT"], ["Bouvet Island", "BV"], ["Botswana", "BW"], ["Belarus", "BY"], ["Belize", "BZ"], ["Canada", "CA"], ["Cocos (Keeling) Islands", "CC"], ["Congo, The Democratic Republic Of The", "CD"], ["Central African Republic", "CF"], ["Congo", "CG"], ["Switzerland", "CH"], ["Côte D'Ivoire", "CI"], ["Cook Islands", "CK"], ["Chile", "CL"], ["Cameroon", "CM"], ["China", "CN"], ["Colombia", "CO"], ["Costa Rica", "CR"], ["Cuba", "CU"], ["Cape Verde", "CV"], ["Curaçao", "CW"], ["Christmas Island", "CX"], ["Cyprus", "CY"], ["Czech Republic", "CZ"], ["Germany", "DE"], ["Djibouti", "DJ"], ["Denmark", "DK"], ["Dominica", "DM"], ["Dominican Republic", "DO"], ["Algeria", "DZ"], ["Ecuador", "EC"], ["Estonia", "EE"], ["Egypt", "EG"], ["Western Sahara", "EH"], ["Eritrea", "ER"], ["Spain", "ES"], ["Ethiopia", "ET"], ["Finland", "FI"], ["Fiji", "FJ"], ["Falkland Islands (Malvinas)", "FK"], ["Micronesia, Federated States Of", "FM"], ["Faroe Islands", "FO"], ["France", "FR"], ["Gabon", "GA"], ["United Kingdom", "GB"], ["Grenada", "GD"], ["Georgia", "GE"], ["French Guiana", "GF"], ["Guernsey", "GG"], ["Ghana", "GH"], ["Gibraltar", "GI"], ["Greenland", "GL"], ["Gambia", "GM"], ["Guinea", "GN"], ["Guadeloupe", "GP"], ["Equatorial Guinea", "GQ"], ["Greece", "GR"], ["South Georgia and the South Sandwich Islands", "GS"], ["Guatemala", "GT"], ["Guam", "GU"], ["Guinea-Bissau", "GW"], ["Guyana", "GY"], ["Hong Kong", "HK"], ["Heard and McDonald Islands", "HM"], ["Honduras", "HN"], ["Croatia", "HR"], ["Haiti", "HT"], ["Hungary", "HU"], ["Indonesia", "ID"], ["Ireland", "IE"], ["Israel", "IL"], ["Isle of Man", "IM"], ["India", "IN"], ["British Indian Ocean Territory", "IO"], ["Iraq", "IQ"], ["Iran, Islamic Republic Of", "IR"], ["Iceland", "IS"], ["Italy", "IT"], ["Jersey", "JE"], ["Jamaica", "JM"], ["Jordan", "JO"], ["Japan", "JP"], ["Kenya", "KE"], ["Kyrgyzstan", "KG"], ["Cambodia", "KH"], ["Kiribati", "KI"], ["Comoros", "KM"], ["Saint Kitts And Nevis", "KN"], ["Korea, Democratic People's Republic Of", "KP"], ["Korea, Republic of", "KR"], ["Kuwait", "KW"], ["Cayman Islands", "KY"], ["Kazakhstan", "KZ"], ["Lao People's Democratic Republic", "LA"], ["Lebanon", "LB"], ["Saint Lucia", "LC"], ["Liechtenstein", "LI"], ["Sri Lanka", "LK"], ["Liberia", "LR"], ["Lesotho", "LS"], ["Lithuania", "LT"], ["Luxembourg", "LU"], ["Latvia", "LV"], ["Libya", "LY"], ["Morocco", "MA"], ["Monaco", "MC"], ["Moldova, Republic of", "MD"], ["Montenegro", "ME"], ["Saint Martin", "MF"], ["Madagascar", "MG"], ["Marshall Islands", "MH"], ["Macedonia, the Former Yugoslav Republic Of", "MK"], ["Mali", "ML"], ["Myanmar", "MM"], ["Mongolia", "MN"], ["Macao", "MO"], ["Northern Mariana Islands", "MP"], ["Martinique", "MQ"], ["Mauritania", "MR"], ["Montserrat", "MS"], ["Malta", "MT"], ["Mauritius", "MU"], ["Maldives", "MV"], ["Malawi", "MW"], ["Mexico", "MX"], ["Malaysia", "MY"], ["Mozambique", "MZ"], ["Namibia", "NA"], ["New Caledonia", "NC"], ["Niger", "NE"], ["Norfolk Island", "NF"], ["Nigeria", "NG"], ["Nicaragua", "NI"], ["Netherlands", "NL"], ["Norway", "NO"], ["Nepal", "NP"], ["Nauru", "NR"], ["Niue", "NU"], ["New Zealand", "NZ"], ["Oman", "OM"], ["Panama", "PA"], ["Peru", "PE"], ["French Polynesia", "PF"], ["Papua New Guinea", "PG"], ["Philippines", "PH"], ["Pakistan", "PK"], ["Poland", "PL"], ["Saint Pierre And Miquelon", "PM"], ["Pitcairn", "PN"], ["Puerto Rico", "PR"], ["Palestine, State of", "PS"], ["Portugal", "PT"], ["Palau", "PW"], ["Paraguay", "PY"], ["Qatar", "QA"], ["Réunion", "RE"], ["Romania", "RO"], ["Serbia", "RS"], ["Russian Federation", "RU"], ["Rwanda", "RW"], ["Saudi Arabia", "SA"], ["Solomon Islands", "SB"], ["Seychelles", "SC"], ["Sudan", "SD"], ["Sweden", "SE"], ["Singapore", "SG"], ["Saint Helena", "SH"], ["Slovenia", "SI"], ["Svalbard And Jan Mayen", "SJ"], ["Slovakia", "SK"], ["Sierra Leone", "SL"], ["San Marino", "SM"], ["Senegal", "SN"], ["Somalia", "SO"], ["Suriname", "SR"], ["South Sudan", "SS"], ["Sao Tome and Principe", "ST"], ["El Salvador", "SV"], ["Sint Maarten", "SX"], ["Syrian Arab Republic", "SY"], ["Swaziland", "SZ"], ["Turks and Caicos Islands", "TC"], ["Chad", "TD"], ["French Southern Territories", "TF"], ["Togo", "TG"], ["Thailand", "TH"], ["Tajikistan", "TJ"], ["Tokelau", "TK"], ["Timor-Leste", "TL"], ["Turkmenistan", "TM"], ["Tunisia", "TN"], ["Tonga", "TO"], ["Turkey", "TR"], ["Trinidad and Tobago", "TT"], ["Tuvalu", "TV"], ["Taiwan, Republic Of China", "TW"], ["Tanzania, United Republic of", "TZ"], ["Ukraine", "UA"], ["Uganda", "UG"], ["United States Minor Outlying Islands", "UM"], ["United States", "US"], ["Uruguay", "UY"], ["Uzbekistan", "UZ"], ["Holy See (Vatican City State)", "VA"], ["Saint Vincent And The Grenedines", "VC"], ["Venezuela, Bolivarian Republic of", "VE"], ["Virgin Islands, British", "VG"], ["Virgin Islands, U.S.", "VI"], ["Vietnam", "VN"], ["Vanuatu", "VU"], ["Wallis and Futuna", "WF"], ["Samoa", "WS"], ["Yemen", "YE"], ["Mayotte", "YT"], ["South Africa", "ZA"], ["Zambia", "ZM"], ["Zimbabwe", "ZW"]]
        country_array.each do |array|
          if array.include? code
            @result = array
          end
        end
        self.iso = @result[1]
        self.country = @result[0]
      else
        self.country = self.country
        self.iso = self.iso
      end
    end
  end

  def check_minimum_info
    errors.add(:base, 'You need to provide at least 1 physician') unless self.physicians.count > 0
  end


  def nurse?
    if self.nurse
      "Yes"
    else
      "No"
    end
  end

  def genetics?
    if self.genetics
      "Yes"
    else
      "No"
    end
  end

  def rheum?
    if self.rheum
      "Yes"
    else
      "No"
    end
  end

  def physio?
    if self.physio
      "Yes"
    else
      "No"
    end
  end


end
