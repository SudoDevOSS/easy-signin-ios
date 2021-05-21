# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Networking' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  def shared_pods
    pod 'Alamofire', '~> 5.4.1'
    pod 'Swinject'
  end

  # Pods for Networking
  shared_pods

  target 'NetworkingTests' do
    # Pods for testing
    shared_pods
    pod 'Mocker', '~> 2.2.0'
  end

end
