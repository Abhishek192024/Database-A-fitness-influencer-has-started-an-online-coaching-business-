// ye main table hai jisme trainer aur client dono aayenge
users [icon: user, color: blue] {
  user_id int pk
  name string
  email string
  phone string
  role string   // trainer ya client ka role
}

// ye plans hai jo influencer sell karega
plans [icon: clipboard, color: purple] {
  plan_id int pk
  title string
  description string
  price number
  duration_days int   // kitne din ka plan hai
}

// ye batata hai kis user ne konsa plan liya
subscriptions [icon: repeat, color: orange] {
  subscription_id int pk
  user_id int
  plan_id int
  start_date timestamp
  end_date timestamp
  status string   // active ya completed
}

// ye sessions hai (consultation ya live class)
sessions [icon: video, color: green] {
  session_id int pk
  client_id int
  trainer_id int
  session_date timestamp
  session_type string   // consultation ya live session
  status string
}

// ye weekly check-in hai (client progress report deta hai)
checkins [icon: activity, color: purple] {
  checkin_id int pk
  client_id int
  date timestamp
  weight number
  notes string   // trainer ke liye feedback
}

// ye detailed progress tracking hai (measurements wagaira)
progress [icon: trending-up, color: orange] {
  progress_id int pk
  client_id int
  date timestamp
  measurement string   // chest, waist, etc.
  value number
}

// ye payment ka record rakhta hai
payments [icon: credit-card, color: green] {
  payment_id int pk
  subscription_id int
  amount number
  payment_date timestamp
  status string   // paid ya pending
}

// relations start yaha se

// ek user multiple subscriptions le sakta hai
users.user_id < subscriptions.user_id

// ek plan multiple users le sakte hain
plans.plan_id < subscriptions.plan_id

// ek trainer aur client ke beech multiple sessions ho sakte hain
users.user_id < sessions.client_id
users.user_id < sessions.trainer_id

// ek client multiple checkins de sakta hai
users.user_id < checkins.client_id

// ek client ka progress multiple entries me track hoga
users.user_id < progress.client_id

// ek subscription ka payment hota hai
subscriptions.subscription_id < payments.subscription_id
