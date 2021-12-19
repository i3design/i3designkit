Pod::Spec.new do |spec|
    spec.name         = 'i3designKit'
    spec.version      = '1.5'
    spec.summary      = 'i3designKit'
    spec.license      = { :type => 'BSD' }
    spec.homepage     = 'https://github.com/i3design/i3desgnKit'
    spec.authors      = { 'KUBO Seiya' => 's.kubo@i3design.co.jp' }
    spec.source       = { :git => 'https://github.com/i3design/i3designkit.git', :tag => '1.5' }
    spec.source_files = 'i3designKit.{h,m}'
    spec.framework    = 'SystemConfiguration'
    spec.requires_arc = true

    spec.dependency 'PromiseKit'
end