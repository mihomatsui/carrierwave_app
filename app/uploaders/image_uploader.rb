class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def size_range
    0..5.megabytes
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end
end
