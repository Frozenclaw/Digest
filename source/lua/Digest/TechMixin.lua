if Server then

	function TechMixin:OnDigested()
		self:UpdateTechAvailability()
	end
end