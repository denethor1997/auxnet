local M = { }

function M.parse(arg)
   local cmd = torch.CmdLine()
   cmd:text()
   cmd:text('Torch-7 AuxResNet Testing script')
   cmd:text()
   cmd:text('Options:')
    ------------ General options --------------------

   cmd:option('-dataset',    'cifar10', 'Options: cifar10 | cifar100 | svhn')
   cmd:option('-manualSeed', 1,          'Manually set RNG seed')
   cmd:option('-pretrain',        'pretrain',      'Path to save trained models')
   cmd:option('-gen',        'gen',      'Path to save generated files')
   ------------- Data options ------------------------
   cmd:option('-nThreads',        10, 'number of data loading threads')
   ------------- Training options --------------------
   cmd:option('-batchSize',       128,      'mini-batch size (1 = pure stochastic)')
   cmd:option('-testOnly',        'true', 'Run on validation set only')
   ---------- Model options ----------------------------------
   cmd:option('-trainedModel',      'none',   'Path to the trained model')
   cmd:option('-outputs',   'none',   'Path to an outputs file')

   cmd:text()

   local opt = cmd:parse(arg or {})

   opt.testOnly = opt.testOnly ~= 'false'

   local modelList = {
      ['cifar10-auxresnet-56-2'] = '',
      ['cifar10-auxresnet-56-5'] = '',
      ['cifar10-auxresnet-26-2-wide-10'] = '',
      ['cifar100-auxresnet-56-2'] = '',
      ['cifar100-auxresnet-56-5'] = '',
      ['cifar100-auxresnet-26-2-wide-10'] = '',
      ['svhn-auxresnet-56-3-dropout'] = '',
   }
   local outputsList = {
      ['cifar10-auxresnet-56-5-auxoutputs'] = '',
   }
   if opt.trainedModel ~= 'none' then
      assert(modelList[opt.trainedModel], 'Invalid model: ' .. opt.trainedModel)
   end
   if opt.outputs ~= 'none' then
      assert(outputsList[opt.outputs], 'Invalid outputs: ' .. opt.outputs)
   end
   return opt
end

return M