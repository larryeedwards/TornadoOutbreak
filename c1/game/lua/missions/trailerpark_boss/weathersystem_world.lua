weatherstuff1 = {}

function on_postload()
  weatherstuff1[1] = gomgr.getbyoid(497)
  weatherstuff1[2] = gomgr.getbyoid(499)
  weatherstuff1[3] = gomgr.getbyoid(500)
--                                                   
--                                                   
--                                                   
--                                                   
--                                                   
--                                                   
--                                                   
--                                                    
--                                                    
--                                                    
--                                                    
--                                                    
--                                                    
end

function addphase1()
  for i = 1, #weatherstuff1 do
   (weatherstuff1[i]):addtoworld()
  end
end

function removephase1()
  for i = 1, #weatherstuff1 do
    (weatherstuff1[i]):removefromworld()
  end
end

function on_label(label)
  if label == "weatherphase0" then
    this.curphase = 0
    removephase1()
  end

  if label == "weatherphase1" then
    this.curphase = 1
    addphase1()
  end

  if label == "weatherphase2" then
    this.curphase = 2
    removephase1()
  end
end