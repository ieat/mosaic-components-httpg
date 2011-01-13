{application, rabbit_common,
 [{description, "RabbitMQ Common Libraries"},
  {vsn, "2.2.0"},
  {modules, [
             rabbit_writer,
             rabbit_reader,
             rabbit_framing_amqp_0_8,
             rabbit_framing_amqp_0_9_1,
             rabbit_framing_channel,
             rabbit_basic,
             rabbit_binary_generator,
             rabbit_binary_parser,
             rabbit_channel,
             rabbit_exchange_type,
             rabbit_misc,
             rabbit_net,
             rabbit_heartbeat,
             rabbit_msg_store_index,
             gen_server2,
             priority_queue,
             supervisor2
  ]},
  {registered, []},
  {env, []},
  {applications, [kernel, stdlib]}]}.