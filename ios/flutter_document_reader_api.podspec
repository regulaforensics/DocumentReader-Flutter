Pod::Spec.new do |s|
  s.name             = 'flutter_document_reader_api'
  s.version          = '9.10.1962'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_document_reader_api/src/*.{h,m}'
  s.public_header_files = 'flutter_document_reader_api/src/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '16.0'
  s.dependency 'DocumentReader', '9.10.7343'
  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
