function on_label(label)
  if label == "inspot" then
    this.fujitarating = this.fujitarating + 1
  elseif label == "outspot" then
    this.fujitarating = this.fujitarating - 1
  end
end