# encoding: utf-8
require 'test_helper'

class HCardTest < ActiveSupport::TestCase

  test "renders address in UK format" do
    assert_equal gb_hcard, HCard.new(hcard_fields, 'GB').render
  end

  test "renders address in Spanish format" do
    assert_equal es_hcard, HCard.new(hcard_fields, 'ES').render
  end

  test "renders address in Japanese format" do
    assert_equal jp_hcard, HCard.new(hcard_fields, 'JP').render
  end

  def hcard_fields
    { 'fn' => 'Recipient',
      'street-address' => 'Street',
      'postal-code' => 'Postcode',
      'locality' => 'Locality',
      'region' => 'Region',
      'country-name' => 'Country'
    }
  end

  def gb_hcard
'<div class="vcard">
<div class="adr">
<span class="fn">Recipient</span><br />
<span class="street-address">Street</span><br />
<span class="locality">Locality</span><br />
<span class="region">Region</span><br />
<span class="postal-code">Postcode</span><br />
<span class="country-name">Country</span>
</div>
</div>'
  end

  def es_hcard
'<div class="vcard">
<div class="adr">
<span class="fn">Recipient</span><br />
<span class="street-address">Street</span><br />
<span class="postal-code">Postcode</span> <span class="locality">Locality</span> <span class="region">Region</span><br />
<span class="country-name">Country</span>
</div>
</div>'
  end

  def jp_hcard
'<div class="vcard">
<div class="adr">
〒<span class="postal-code">Postcode</span><br />
<span class="region">Region</span><span class="locality">Locality</span><span class="street-address">Street</span><br />
<span class="fn">Recipient</span><br />
<span class="country-name">Country</span>
</div>
</div>'
  end
end
