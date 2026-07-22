SELECT
CASE WHEN y.journey_name = '' then 'NA' ELSE y.journey_name END as journey_name,
y.channel as message_type,
CASE 
  WHEN channel = 'Email' then y.email_name
  WHEN channel = 'Mobile Push' then y.push_send_name
  ELSE 'Unknown'
  END as message_name,
y.Day_1,
y.Day_2,
y.Day_3,
y.Day_4,
y.Day_5,
y.Day_6,
y.Day_7,
y.Day_8,
y.Day_9,
y.Day_10,
y.Day_11,
y.Day_12,
y.Day_13,
y.Day_14,
y.Day_15,
y.Day_16,
y.Day_17,
y.Day_18,
y.Day_19,
y.Day_20,
y.Day_21,
y.Day_22,
y.Change_8to1,
y.Change_9to2,
y.Change_10to3,
y.Change_11to4,
y.Change_12to5,
y.Change_13to6,
y.Change_14to7,
CASE WHEN y.no_sends = 'Y' THEN 'null sends' END AS no_sends,
CASE WHEN (
    y.no_sends = 'N' AND
    ((y.Change_8to1 = 'H' and y.Change_15to1 = 'H') or (y.Change_8to1 = 'H' and y.Change_22to1 = 'H'))
) THEN 'Y' END AS more_sends,
CASE WHEN (
    y.no_sends = 'N' AND
    ( (y.Change_8to1 = 'L' and y.Change_15to1 = 'L') or (y.Change_8to1 = 'L' and y.Change_22to1 = 'L') )
) THEN 'Y' END AS low_sends

from

(SELECT
x.journey_name,
x.push_send_name,
x.email_name,
x.channel,
x.Day_1,
x.Day_2,
x.Day_3,
x.Day_4,
x.Day_5,
x.Day_6,
x.Day_7,
x.Day_8,
x.Day_9,
x.Day_10,
x.Day_11,
x.Day_12,
x.Day_13,
x.Day_14,
x.Day_15,
x.Day_16,
x.Day_17,
x.Day_18,
x.Day_19,
x.Day_20,
x.Day_21,
x.Day_22,
CASE
    WHEN x.email_name = 'GLO_LFC_Lifecycle-Nearly_Gold_GALEQ423' and journey_name = 'Nearly_Elite_Diamond_Deployment' then 'N'
    WHEN x.Day_1+x.Day_2+x.Day_3+x.Day_4+x.Day_5+x.Day_6+x.Day_7+x.Day_8+x.Day_9+x.Day_10+x.Day_11+x.Day_12+x.Day_13+x.Day_14+x.Day_15+x.Day_16+x.Day_17+x.Day_18+x.Day_19+x.Day_20+x.Day_21+x.Day_22 > 0 THEN 'Y' 
    Else 'N' END as Include,
CASE WHEN x.Day_1 = 0 THEN 'Y'
     ELSE 'N'
END as no_sends,
CASE WHEN x.Day_8 > 0 and (x.Day_1 - x.Day_8) / (x.Day_8 *  100.00) > 0.0025 THEN 'H' 
     WHEN x.Day_8 > 0 and (x.Day_1 - x.Day_8) / (x.Day_8 *  100.00) < -0.0025 THEN 'L' 
     ELSE 'N'
END AS Change_8to1,
CASE WHEN x.Day_15 > 0 and (x.Day_1  - x.Day_15) / (x.Day_15 * 100.00) > 0.0015 THEN 'H'
     WHEN x.Day_15 > 0 and (x.Day_1  - x.Day_15) / (x.Day_15 * 100.00) < -0.0015 THEN 'L'
     ELSE 'N'
END AS Change_15to1,
CASE WHEN x.Day_22 > 0 and (x.Day_1  - x.Day_22) / (x.Day_22 * 100.00) > 0.0015 THEN 'H'
     WHEN x.Day_22 > 0 and (x.Day_1  - x.Day_22) / (x.Day_22 * 100.00) < -0.0015 THEN 'L'
     ELSE 'N'
END AS Change_22to1,
CASE WHEN x.Day_9 > 0 and (x.Day_2 - x.Day_9) / (x.Day_9 *  100.00) > 0.0025 THEN 'H'
     WHEN x.Day_9 > 0 and (x.Day_2 - x.Day_9) / (x.Day_9 *  100.00) < -0.0025 THEN 'L'
     ELSE 'N'    
     END AS Change_9to2,
CASE WHEN x.Day_10 > 0 and (x.Day_3 - x.Day_10) / (x.Day_10 *  100.00) > 0.0025 THEN 'H'
     WHEN x.Day_10 > 0 and (x.Day_3 - x.Day_10) / (x.Day_10 *  100.00) < -0.0025 THEN 'L'
     ELSE 'N'    
     END AS Change_10to3,
CASE WHEN x.Day_11 > 0 and (x.Day_4 - x.Day_11) / (x.Day_11 *  100.00) > 0.0025 THEN 'H'
     WHEN x.Day_11 > 0 and (x.Day_4 - x.Day_11) / (x.Day_11 *  100.00) < -0.0025 THEN 'L'
     ELSE 'N'    
     END AS Change_11to4,
CASE WHEN x.Day_12 > 0 and (x.Day_5 - x.Day_12) / (x.Day_12 *  100.00) > 0.0025 THEN 'H'
     WHEN x.Day_12 > 0 and (x.Day_5 - x.Day_12) / (x.Day_12 *  100.00) < -0.0025 THEN 'L'
     ELSE 'N'    
     END AS Change_12to5,
CASE WHEN x.Day_13 > 0 and (x.Day_6 - x.Day_13) / (x.Day_13 *  100.00) > 0.0025 THEN 'H'
     WHEN x.Day_13 > 0 and (x.Day_6 - x.Day_13) / (x.Day_13 *  100.00) < -0.0025 THEN 'L'
     ELSE 'N'    
     END AS Change_13to6,
CASE WHEN x.Day_14 > 0 and (x.Day_7 - x.Day_14) / (x.Day_14 *  100.00) > 0.0025 THEN 'H'
     WHEN x.Day_14 > 0 and (x.Day_7 - x.Day_14) / (x.Day_14 *  100.00) < -0.0025 THEN 'L'
     ELSE 'N'    
     END AS Change_14to7
from
(
    SELECT
    w.journey_name,w.push_send_name,w.email_name,w.channel,
    SUM(Day_1) as Day_1,SUM(Day_2) as Day_2,SUM(Day_3) as Day_3,SUM(Day_4) as Day_4,SUM(Day_5) as Day_5,SUM(Day_6) as Day_6,SUM(Day_7) as Day_7,SUM(Day_8) as Day_8,SUM(Day_9) as Day_9,SUM(Day_10) as Day_10,SUM(Day_11) as Day_11,SUM(Day_12) as Day_12,SUM(Day_13) as Day_13,SUM(Day_14) as Day_14,SUM(Day_15) as Day_15,SUM(Day_16) as Day_16,SUM(Day_17) as Day_17,SUM(Day_18) as Day_18,SUM(Day_19) as Day_19,SUM(Day_20) as Day_20,SUM(Day_21) as Day_21,SUM(Day_22) as Day_22
    FROM
    (
    
    SELECT
    journey_name,
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        REPLACE(
                                                            REPLACE(
                                                                REPLACE(
                                                                    REPLACE(
                                                                        REPLACE(
                                                                            REPLACE(
                                                                                REPLACE(
                                                                                    REPLACE(
                                                                                        REPLACE(
                                                                                            REPLACE(
                                                                                                REPLACE(
                                                                                                    REPLACE(
                                                                                                        REPLACE(
                                                                                                            REPLACE(
                                                                                                                REPLACE(
                                                                                                            push_send_name,'AMEN',''
                                                                                                            ),'AMAR',''
                                                                                                            ),'AMID',''
                                                                                                            ),'AMJP',''
                                                                                                            ),'AMKO',''
                                                                                                            ),'AMTH',''
                                                                                                            ),'AMVI',''
                                                                                                            ),'CAEN',''
                                                                                                            ),'CAFR',''
                                                                                                            ),'EUDE',''
                                                                                                            ),'EUEN',''
                                                                                                            ),'EUES',''
                                                                                                            ),'EUFR',''
                                                                                                            ),'EUIT',''
                                                                                                            ),'EUNL',''
                                                                                                            ),'EURU',''
                                                                                                            ),'EUPL',''
                                                                                                            ),'EUPT',''
                                                                                                            ),'GCEN',''
                                                                                                            ),'GCZH',''
                                                                                                            ),'MSEN',''
                                                                                                            ),'MSES',''
                                                                                                            ),'MSPT',''
                                                                                                            ),'USEN',''
                                                                                                            ),'USES',''
                                                                                                            ),' ',''
                                                                                                            ),'DayOfStayPush_-2025','DayOfStayPush'
                                                                                                            ),'DayOfStayPush__2025','DayOfStayPush'
                                                                                                            )
    as push_send_name,
    REPLACE(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        REPLACE(
                            REPLACE(
                                REPLACE(
                                    REPLACE(
                                        REPLACE(
                                            REPLACE(
                                                REPLACE(
                                                    REPLACE(
                                                        REPLACE(
                                                            REPLACE(
                                                                REPLACE(
                                                                    REPLACE(
                                                                        REPLACE(
                                                                            REPLACE(
                                                                                REPLACE(
                                                                                    REPLACE(
                                                                                        REPLACE(
                                                                                            REPLACE(
                                                                                                REPLACE(
                                                                                                    REPLACE(
                                                                                                        REPLACE(
                                                                                                            REPLACE(
                                                                                                                REPLACE(
                                                                                                                    REPLACE(
                                                                                                                        REPLACE(
                                                                                                                            REPLACE(
                                                                                                                                REPLACE(
                                                                                                                                    REPLACE(
                                                                                                                                        REPLACE(
                                                                                                                                            REPLACE(
                                                                                                                                                REPLACE(
                                                                                                                                                    REPLACE(
                                                                                                                                                        REPLACE(
                                                                                                                                                            REPLACE(
                                                                                                                                                                REPLACE(
                                                                                                                                                                    REPLACE(
                                                                                                                                                                        REPLACE(
                                                                                                                                                                            REPLACE(
                                                                                                                                                                                REPLACE(
                                                                                                                                                                                    REPLACE(
                                                                                                                                                                                        REPLACE(
                                                                                                                                                                                            REPLACE(
                                                                                                                                                                                                REPLACE(
                                                                                                                                                                                                    REPLACE(
                                                                                                                                                                                                        REPLACE(                                                                                                                                              
                                                                                                                                                                                                                REPLACE(
                                                                                                                                                                                                                    REPLACE(
                                                                                                                                                                                                                        REPLACE(
                                                                                                                                                                                                                            REPLACE(
                                                                                                                                                                                                                                REPLACE(
                                                                                                                                                                                                                                    REPLACE(
                                                                                                                                                                                                                                        REPLACE(
                                                                                                                                                                                                                                            REPLACE(
                                                                                                                                                                                                                                                REPLACE(
                                                                                                                                                                                                                                                    REPLACE(
                                                                                                                                                                                                                                                        REPLACE(
                                                                                                                                                                                                                                                            REPLACE(
                                                                                                                                                                                                                                                                REPLACE(
                                                                                                                                                                                                                                                                    REPLACE(
                                                                                                                                                                                                                                                                         REPLACE(
                                                                                                                                                                                                                                                                             REPLACE(
                                                                                                                                                                                                                                                                                REPLACE(
                                                                                                                                                                                                                                                                                                                                                        
                                                                                                                                                                 email_name, 
                                                                                                                                                               'GLO_LFC_Educate_Batch2_ProfilePref_1274000_A1_20240429_AMAR_V2','GLO_LFC_Educate_Batch2_ProfilePref_1274000_A1_20240429'
                                                                                                                                                                ),'GLO_LFC_Educate_Batch2_AppSpotlight_1274000_A1_20240429_USEN','GLO_LFC_Educate_Batch2_AppSpotlight_1274000_A1_20240429'
                                                                                                                                                                ),'__V2',''
                                                                                                                                                                ),'_V2',''
                                                                                                                                                                ),'_20250410_',''
                                                                                                                                                                ),'_20250411_',''
                                                                                                                                                                ),'_20250415_',''
                                                                                                                                                                ),'_20250420_',''
                                                                                                                                                                ),'_20250421_',''
                                                                                                                                                                ),'_20240508_',''
                                                                                                                                                                ),'_20240508',''
                                                                                                                                                                ),' - V2',''
                                                                                                                                                                ),'AMAR',''
                                                                                                                                                                ),'AMEN',''
                                                                                                                                                                ),'AMID',''
                                                                                                                                                                ),'AMJP',''
                                                                                                                                                                ),'AMKO',''
                                                                                                                                                                ),'AMTH',''
                                                                                                                                                                ),'AMTR',''
                                                                                                                                                                ),'AMVI',''
                                                                                                                                                                ),'CAEN',''
                                                                                                                                                                ),'CAFR',''
                                                                                                                                                                ),'ESES',''
                                                                                                                                                                ),'EUDE',''
                                                                                                                                                                ),'EUEN',''
                                                                                                                                                                ),'EUES',''
                                                                                                                                                                ),'EUFR',''
                                                                                                                                                                ),'EUIT',''
                                                                                                                                                                ),'EUNL',''
                                                                                                                                                                ),'EUPL',''
                                                                                                                                                                ),'EUPT',''
                                                                                                                                                                ),'EURU',''
                                                                                                                                                                ),'GCZH',''
                                                                                                                                                                ),'GCEN',''
                                                                                                                                                                ),'MSEN',''
                                                                                                                                                                ),'MSES',''
                                                                                                                                                                ),'MSPT',''
                                                                                                                                                                ),'TWZH',''
                                                                                                                                                                ),'USES',''
                                                                                                                                                                ),'USEN',''
                                                                                                                                                               
                                                                                                                                                                ),'AbandonCart_A1_','AbandonCart_A1'
                                                                                                                                                                ),'(-USEN)',''
                                                                                                                                                                ),' ',''
                                                                                                                                                                ),'()',''
                                                                                                                                                                ),'1112_','1112'
                                                                                                                                                                ),'1115_','1115'
                                                                                                                                                                ),'1116_','1116'
                                                                                                                                                                ),'1024_','1024'
                                                                                                                                                                ),'-GALE2023Q4',''
                                                                                                                                                                ),'Gale_GLO_LFC','GLO_LFC'
                                                                                                                                                                ),'_GALEQ423',''
                                                                                                                                                                ),'_GALE2023Q4',''
                                                                                                                                                                ),'-GALEQ423',''
                                                                                                                                                                ),'-Gale',''
                                                                                                                                                                ),'_Regional_',''
                                                                                                                                                                ),'_Gale',''
                                                                                                                                                                ),'20240429_JP_','20240429'
                                                                                                                                                                ),'_20241016_','_20241016'                                                                                                                                    
                                                                                                                                                                ),'_2024_','_2024'
                                                                                                                                                                ),'20250331_','20250331'
                                                                                                                                                                ),'20250403_','20250403'
                                                                                                                                                                ),'20250408_','20250408'
                                                                                                                                                                ),'10k','[Consolidated]'
                                                                                                                                                                ),'20k','[Consolidated]'
                                                                                                                                                                ),'12740000','1274000'
                                                                                                                                                                ),'20241023_','20241023'
                                                                                                                                                                ),'20251218_','20251218'
                                                                                                                                                               
                                                                                                                                                            
                                                                                                                                                                )
    as email_name,
    channel,
    SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '1' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '1' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_1,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '2' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '2' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_2,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '3' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '3' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_3,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '4' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '4' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_4,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '5' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '5' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_5,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '6' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '6' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_6,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '7' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '7' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_7,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '8' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '8' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_8,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '9' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '9' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_9,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '10' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '10' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_10,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '11' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '11' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_11,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '12' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '12' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_12,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '13' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '13' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_13,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '14' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '14' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_14,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '15' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '15' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_15,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '16' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '16' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_16,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '17' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '17' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_17,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '18' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '18' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_18,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '19' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '19' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_19,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '20' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '20' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_20,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '21' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '21' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_21,
        SUM(CASE 
        WHEN channel = 'Email' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '22' DAY as date) THEN email_sends
        WHEN channel = 'Mobile Push' and CAST(event_date AS date) = CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '22' DAY as date) THEN push_sends
        ELSE 0 
    END) AS Day_22
FROM
    engagement_data
WHERE
    event_date >= CAST((now() AT TIME ZONE 'America/New_York') - INTERVAL '23' DAY as date)
    and 
    (email_name in ('GLO_POS_PostStay_Mbr_20260401_LIVE','GLO_POS_PostStay_SX_Mbr_20260401_LIVE','GLO_POS_PostStay_GE_Mbr_20260401_LIVE')
    or
    (
    journey_id <> '236C42EC-2501-45E0-B8A8-56E925FF1485'
    and
    journey_name in
    (
            'Achieved_Member_Choice_Issued_Deployment_2024'
            ,'GLO_LFC_18-24 Months_Inactive_Daily_26102023'
            ,'GLO_LFC_Birthday_Offer_Registration'
            ,'GLO_LFC_Birthday PUSH - booking reminder'
            ,'GLO_LFC_Educate_AppSpotlight_1274000_A1_v2'
            ,'GLO_LFC_Educate_Brand Property Inspiration'
            ,'GLO_LFC_Educate_Evergreen App - A1 - Announcement - Launch'
            ,'GLO_LFC_Educate_Evergreen App - A2 - Announcement - Reminder'
            ,'GLO_LFC_Educate_Evergreen App - B1 - Booking Reminder'
            ,'GLO_LFC_Educate_Evergreen App Offer Completion_T1 - V2' 
            ,'NEW_GLO_LFC_Educate_How_to_Earn_Redeem_Points'
            ,'GLO_LFC_Educate_IHGOR_Benefits_Overview_V2'
            ,'NEW_GLO_LFC_Educate_Member_Profile_Preferences_1274000_A1'
            ,'GLO_LFC_Educate_Ways to Build Points Balance'
            ,'GLO_LFC_Educate_Ways to Build Points Balance_v2'
            ,'GLO_LFC_Educate_Welcome_to_IHGOR_INN_Enrollee_v2'
            ,'GLO_LFC_Educate_Welcome_to_IHGOR_NonINN_Enrollee_v2'
            ,'GLO_LFC_FastTrackOfferComp_1415050_T3_20241016'
            ,'GLO_LFC_ImmediateEnrollDepositConf_1434001_B1'
            ,'GLO_LFC_JPEducate1stStayNonOffer_PUSH'
            ,'GLO_LFC_Lapsed_In_Offer_Booking_Reminder'
            ,'GLO_LFC_Lapsed_In_Offer_Booking_Reminder_Push'
            ,'GLO_LFC_Lifecycle- Birthday Offer Completion'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_10YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_10YR_15YR_PUSH'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_15YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_1YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_1YR_4YR_PUSH'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_20YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_20YR_25YR_PUSH'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_25YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_2YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_3YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_4YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_5YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Booking_Reminder_5YR_PUSH'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_1YR'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_2YR'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_3YR'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_4YR'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_5YR'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_10YR'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_15YR'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_20YR'
            ,'NEW_GLO_LFC_Lifecycle-Anniversary_Offer_Completion_25YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_10YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_15YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_1YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_20YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_25YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_2YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_3YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_4YR'
            ,'GLO_LFC_Lifecycle-Anniversary_Offer_Registration_5YR'
            ,'GLO_LFC_Lifecycle-Cobrand_2024'
            ,'GLO_LFC_Lifecycle-Million_Points_Celebrations_08162022'
            ,'GLO_LFC_Lifecycle-Thousand_Lifetime_Nights'
            ,'GLO_LFC_Lifecycle-Unique_Countries_Celebration'
            ,'GLO_LFC_Lifecycle-Unique_Properties_Celebration'
            ,'GLO_LFC_Q2MilestoneRewardsEducation_1386000_A1_20240930'
            ,'GLO_LFC_Q2MilestoneRewardsHighlight_1386000_A1_20240930'
            ,'GLO_LFC_Redemption_LargePointBalance_1386000_A1_20241115'
            ,'GLO_LFC_Redemption_LargePointBalance_1386000_A1_20241115_Push_v2'
            ,'GLO_LFC_RedemptionAllMemberEd_1386000_A1_20241115'
            ,'GLO_LFC_RedemptionCloseToReward_1386000_A1_20241112'
            ,'GLO_LFC_RedemptionNewMemberEd_1386000_A1_20241112'
            ,'GLO_LFC_RedemptionQualifiedReward_1386000_A1_20241112'
            ,'GLO_LifeCycle_Lapsed_In_Offer_Registration'
            ,'JPEducate_ANA Partnership_1455050_A1_20241021'
            ,'LFC_GLO_Birthday_Offer_Booking_Reminder'
            ,'New_GLO_LFC_Milestone-Rewards_Redeemed_CSU'
            ,'New_GLO_LFC_Milestone-Rewards_Redeemed_FAB'
            ,'Point_Expiration_30days_Prod'
            ,'Point_Expiration_60days_prod'
            ,'Point_Expiration_7day_prod'
            ,'Day of Stay Push_2025'
            ,'DigitalCheckin_JB_Timezone1_prod'
            ,'GLO_LFC_Birthday PUSH - booking reminder'
            ,'GLO_LFC_Lifecycle-Thousand_Lifetime_Nights_08182022'
            ,'GLO_LifeCycle_Lapsed_In_Offer_Completion_08102022'
            ,'IHG_DigitalCheckOut [AMER-prod ]'
            ,'PreStay_prod'
            ,'MCP Abandoned Cart Omni-Channel'
            ,'GLO_LFC_1stStayOfferReg_1486100_A1_20250331'
            ,'GLO_LFC_1stStayOfferRegReminder_1486100_A2_20250408'
            ,'GLO_LFC_1stStayOfferBook_1486100_B1_20250403'
            ,'GLO_LFC_1stStayOfferBook_1486100_USEN_PUSH'
            ,'NEW_GLO_LFC_2ndStayOffer10k20kReg_Global_1423351_A1_20250408'
            ,'GLO_LFC_2ndStayOffer10k20kReg_Global_1423351_A2_20250415'
            ,'NEW_GLO_LFC_2ndStayOffer10k20kReg_OTA_1423351_A1_20250408'
            ,'GLO_LFC_2ndStayOffer10k20kReg_OTA_1423351_A2_20250415'
            ,'NEW_GLO_LFC_2ndStayOffer10k20kReg_RegionalJapan_1423351_A1_20250408'
            ,'GLO_LFC_2ndStayOffer10k20kReg_RegionalJapan_1423351_A2_20250415'
            ,'GLO_LFC_2ndStayOffer10k20kBkg_RegionalJapan_1423351_B1_20250411'
            ,'GLO_LFC_2ndStayOffer10k20kBkg_Global_1423351_B1_20250411'
            ,'GLO_LFC_2ndStayOffer10k20kBkg_OTA_1423351_B1_20250411'
            ,'NEW_GLO_LFC_2ndStayOffer10k20kComp_Global_1423351_T1_20250421'
            ,'NEW_GLO_LFC_2ndStayOffer10k20kComp_OTA_1423351_T1_20250421'
            ,'GLO_LFC_2ndStayOffer10k20kComp_RegionalJapan_1423351_T1_20250421'
            ,'GLO_LFC_2ndStayOffer10k20kBook_Japan_Push'
            ,'GLO_LFC_EducateDE_WelcomeEnrollee_20252167_A1_20250626'
            ,'GLO_LFC_Milestone-Rewards_Reminder_7_20252238_20251223'
            ,'GLO_LFC_Milestone-Rewards_Reminder_14_20252238_20251223'
            ,'GLO_LFC_Milestone-Rewards_Reminder_30_20252238_20251223'
            ,'GLO_LFC_Milestone-Rewards_Reminder_60_20252238_20251223'
            ,'GLO_LFC_Milestone-Rewards_Reminder_87_20252238_20251223'
            ,'GLO_LFC_Milestone_Rewards_Choice_Confirmation_20252238_20260304'
            ,'New_GLO_LFC_Milestone-Rewards_Expiration_ALM'
            ,'New_GLO_LFC_Milestone-Rewards_Expiration_CSU_14_Days'
            ,'New_GLO_LFC_Milestone-Rewards_Expiration_CSU_34_Days'
            ,'New_GLO_LFC_Milestone-Rewards_Expiration_CSU_64_Days'
            ,'New_GLO_LFC_Milestone-Rewards_Expiration_FAB_15_Days'
            ,'New_GLO_LFC_Milestone-Rewards_Expiration_FAB_35_Days'
            ,'New_GLO_LFC_Milestone-Rewards_Expiration_FAB_65_Days'
            ,'New_GLO_LFC_Milestone-Rewards_Redeemed_CSU'
            ,'New_GLO_LFC_Milestone-Rewards_Redeemed_FAB'
            ,'New_GLO_LFC_Milestone_Rewards_Cancelled_Journey'
            ,'Nearly_Elite_Diamond_Deployment_2026'
            ,'Nearly_Elite_Gold_Deployment_2026'
            ,'Nearly_Elite_Platinum_Deployment_2026'
            ,'Nearly_Elite_Silver_Deployment_2026'
            ,'GLO_LFC_Q2MilestoneRewardsNearly_1386000_A1_20240930'
            ,'Newly_Elite_Silver_20231017'
            ,'Newly_Elite_Gold_20231017'
            ,'Newly_Elite_Diamond_20231017'
            ,'Newly_Elite_Platinum_20231017'
            ,'GLO_LFC_Nurture_Tier_Maintain'
            ,'GLO_LFC_2ndStayOffer20kReg_Cyber5XAudience_1423351_A1_20260127'
            ,'GLO_LFC_Lifecycle_Redeemed_Reward_Night_20260210'
            ,'GLO_LFC_Campaign_A_NextStay10k_20k_Book_20262649_20260518'
            ,'GLO_LFC_Campaign_A_NextStay_10k_20kReg_20262649_20260514'
            ,'GLO_LFC_Campaign_A_NextStay10k_20kRegRem_20262649_20260521'
            ,'GLO_LFC_Campaign_A_NextStay_10K_20K_Comp_20262649_20260527'
            ,'GLO_LFC_NextStay10k_20k_Reg_20262649_20260514_Push'
            ,'GLO_LFC_Campaign_B_NextStay_10k_20kBkg_20262649_20260616'
            ,'GLO_LFC_Campaign_B_NextStay_10k_20kReg_20262649_20260613'
            ,'GLO_LFC_NextStay_Campaign_B_10k_20k_Reg_20262649_20260514_Push'
            ,'GLO_LFC_Campaign_B_NextStay_10k_20kCompB_20262649_20260626'
            ,'GLO_LFC_PtsReinstateL25_20262787_20260618'
            ,'GLO_LFC_PtsReinstateM25_20262787_20260618'
            ,'GLO_LFC_MR100NightsReg_20262702_20260624'
            ,'GLO_LFC_MR100NightsBook_20262702_20260706'
            ,'GLO_LFC_MR100NightsReg_20262702_20260624_Push'
            ,'GLO_LFC_MR100NightsRegRem_20262702_20260702'
            ,'GLO_LFC_PCSRP26L_20262701_20260518'
            ,'GLO_LFC_PCSRP26K_20262701_20260518'
            ,'GLO_LFC_Campaign_C_NextStay_10k_20k_Bkg_20262649_20260613'
            ,'GLO_LFC_Campaign_C_NextStay10k_20k_RegRem_20262649_20260521'
        )
    ))
    
GROUP BY
    journey_name,
    push_send_name,
    email_name,
    channel) w
    GROUP BY
    w.journey_name,
    w.push_send_name,
    w.email_name,
    w.channel
    ) x 
    ) y WHERE y.Include = 'Y'
ORDER BY y.journey_name asc
OFFSET 0 rows