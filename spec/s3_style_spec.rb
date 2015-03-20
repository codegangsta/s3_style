require 'spec_helper'

describe S3Style::Url do
  it "initializes with a s3 url" do
    url = 's3://s3.amazonaws.com/specs/image.png'
    subject = S3Style::Url.new(url)
    expect(subject.s3_url).to eq(url)
  end
end

describe S3Style::Url, "#style" do
  subject { S3Style::Url.new('s3://s3.amazonaws.com/specs/image.png') }

  it "returns the url when given an empty style" do
    expect(subject.style(nil)).to eq(subject.s3_url)
    expect(subject.style('')).to eq(subject.s3_url)
  end

  it "returns the url when given :none or 'none'" do
    expect(subject.style(:none)).to eq(subject.s3_url)
    expect(subject.style('none')).to eq(subject.s3_url)
  end

  it "returns a url ending in image.extname with image_large.extname given :large" do
    expect(subject.style('large')).to eq(
      's3://s3.amazonaws.com/specs/image_large.png')

    expect(subject.style(:small)).to eq(
      's3://s3.amazonaws.com/specs/image_small.png')
  end

  it "can still inject if the url has query params" do
    subject = S3Style::Url.new('s3://s3.amazonaws.com/specs/image.png?foo=bar&fizz=buzz')

    expect(subject.style('large')).to eq(
      's3://s3.amazonaws.com/specs/image_large.png?foo=bar&fizz=buzz')
  end

  it "replaces the extension with the forced extension if provided" do
    subject = S3Style::Url.new('s3://s3.amazonaws.com/specs/image.png?foo=bar&fizz=buzz', '.jpg')

    expect(subject.style('large')).to eq(
      's3://s3.amazonaws.com/specs/image_large.jpg?foo=bar&fizz=buzz')
  end
end
