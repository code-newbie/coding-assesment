# Single PodFile
# Please define global variabel in the top of files before all target begins
# Target ==> Main don't forget to defines the Pod if you defined new ones
# if not there will be have some issues with linker
# take a look on syntax reference for cocoapods https://guides.cocoapods.org/syntax/podspec.html

# Platform
platform :ios, '11.0'
# Workspace
workspace 'main-app'
source 'https://cdn.cocoapods.org/'
# Network Module
def network_pods
    pod 'Moya'
    pod 'JWTDecode', '~> 2.3'
end
# Application Rx Pods
def application_rx_pods
    pod 'RxSwift', '~> 5'
    pod 'RxCocoa', '~> 5'
    pod 'RxSwiftExt', '~> 5'
    pod 'RxGesture'
end
# Language Pods
def language_pods
    pod 'i18next'
end
# Testing Pods
def test_pods
    pod 'Quick'
    pod 'Nimble'
end
# swiftlint
def swiftlint_pods
    pod 'SwiftLint'
end
# utility pods
def utility_pods
    #pod 'DeviceGuru'
    pod 'FLEX', :configurations => ['Debug', 'SIT', 'UAT']
    pod 'netfox', '~> 1.19'
end

# crypto pods
def crypto_pods
    pod 'SwiftyRSA'
end

# shared pod
# this pod based on dependencies in Common pod
# the value must be equal with target Common
def shared_common_pod
    language_pods
    application_rx_pods
    pod 'Valet', '3.2.8'
    pod 'Kingfisher', '~> 5.0'
    utility_pods
end

# shared pod
# this pod based on dependencies in Common pod
# the value must be equal with target Common
def shared_common_pod
    language_pods
end

# Targeting Pod
# Application Target
# All defined pod must be in target app
# if not it will failed to linked obj
target 'Main' do
    project 'Main/Main.project'
    application_rx_pods
    network_pods
    language_pods
    swiftlint_pods
    utility_pods
    pod 'Valet', '3.2.8'
   use_frameworks! :linkage => :dynamic
end
# MainAssembly
target 'MainAssembly' do
    project 'Assembly/MainAssembly/MainAssembly.project'
    # MainAssembly Tests
    target 'MainAssemblyTests' do
        inherit! :complete
        test_pods
        shared_common_pod
    end
    use_frameworks! :linkage => :dynamic
end

# AppNavigation
target 'AppNavigation' do
    project 'Navigation/AppNavigation/AppNavigation.project'
    network_pods
    # prefer to build as Dynamic Framework
    use_frameworks!
end

# Feature Target
# Splash
target 'Splash' do
    project 'Features/Splash/Splash.project'
    # MainAssembly Tests
    swiftlint_pods
    target 'SplashTests' do
        inherit! :complete
        test_pods
        language_pods
        application_rx_pods
        network_pods
        # since Splash linked with Common
        #shared_common_pod
    end
    use_frameworks! :linkage => :dynamic
end

# VendingMachine
target 'VendingMachine' do
    project 'Features/VendingMachine/VendingMachine.project'
    # MainAssembly Tests
    swiftlint_pods
    target 'VendingMachineTests' do
        inherit! :complete
        test_pods
        language_pods
        application_rx_pods
        network_pods
        # since Splash linked with Common
        #shared_common_pod
    end
    use_frameworks! :linkage => :dynamic
end

# Payment
target 'Payment' do
    project 'Features/Payment/Payment.project'
    # MainAssembly Tests
    swiftlint_pods
    target 'PaymentTests' do
        inherit! :complete
        test_pods
        language_pods
        application_rx_pods
        network_pods
        # since Splash linked with Common
        #shared_common_pod
    end
    use_frameworks! :linkage => :dynamic
end

# Music
target 'Music' do
    project 'Features/Music/Music.project'
    # MainAssembly Tests
    swiftlint_pods
    target 'MusicTests' do
        inherit! :complete
        test_pods
        language_pods
        application_rx_pods
        network_pods
        # since Splash linked with Common
        #shared_common_pod
    end
    use_frameworks! :linkage => :dynamic
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      target.build_settings(config.name)['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    end
  end
end

# Worker target
# Worker
target 'SplashWorker' do
    project 'FeatureWorkers/SplashWorker/SplashWorker.project'
    # MainAssembly Tests
    swiftlint_pods
    target 'SplashWorkerTests' do
        inherit! :complete
        test_pods
        shared_common_pod
    end
    use_frameworks! :linkage => :dynamic
end

# Another framework that depends on 3rd party
# Services Target
target 'NetworkService' do
    project 'NetworkService/NetworkService/NetworkService.project'
    network_pods
    # prefer to build as Dynamic Framework
    use_frameworks!
end
# Common
target 'Common' do
    project 'Commons/Common/Common.project'
    language_pods
    application_rx_pods
    pod 'Valet', '3.2.8'
    utility_pods
    target 'CommonTests' do
        inherit! :complete
        test_pods
    end
    # prefer to build as Dynamic Framework
    use_frameworks! :linkage => :dynamic
end

target 'CommonUIKit' do
    project 'Commons/CommonUIKit/CommonUIKit.project'
    
    target 'CommonUIKitTests' do
        inherit! :complete
        test_pods
    end
     # prefer to build as Dynamic Framework
    use_frameworks! :linkage => :dynamic
end

