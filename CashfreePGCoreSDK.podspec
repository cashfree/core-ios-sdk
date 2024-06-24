#
# Be sure to run `pod lib lint CashfreePGCoreSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

s.name			= "CashfreePGCoreSDK"
s.version		= "2.0.12"
s.summary		= "Cocoapods implementation of Cashfree's Payment SDK"

s.description		= <<-DESC
	Cashfree Payment is a next generation payment gateway that helps 50,000+ Indian and global businesses collect and disburse payments via 100+ payment methods including Visa, MasterCard, Rupay, UPI, IMPS, NEFT, Paytm & other wallets, Pay Later and various EMI options. Cashfree is backed by Silicon Valley investor Y Combinator and was incubated by Paypal.
		  DESC
s.homepage		= "https://cashfree.com"
s.license		= 'MIT'
s.author			= { "Cashfree Payments" => "developers@cashfree.com" }
s.source			= { :git => "https://github.com/cashfree/core-ios-sdk.git", :tag => "core-" + s.version.to_s }
s.social_media_url	= "https://twitter.com/gocashfree"
s.platform		= :ios, "11.0"
s.vendored_frameworks	= "CashfreePGCoreSDK.xcframework"
s.swift_version		= "5.0"
s.dependency 'CashfreeAnalyticsSDK', '~> 2.0.5'

end