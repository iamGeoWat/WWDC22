/*
 Author: Xikai Liu
 Description: The database of crops. Collected and formed by me.
 */

import SwiftUI

struct Plant: Identifiable {
    let name: String
    let botanical: String
    let description: String
    let tip: String
    let notice: String?
    var icon: String {
        "\(self.name.replacingOccurrences(of: " ", with: "_"))_Icon"
    }
    var images: [String]?
    let temperature: (Int, Int)?
    let sowingPeriod: (Int, Int)
    let matureTime: Int
    var plantedTime: Date?
    var intervalEvents: [Event]?
    var singleEvents: [Event]?
    let id: String = UUID().uuidString
}

var hotPepper = Plant(
    name: "Hot Pepper", 
    botanical: "Capsicum annuum",
    description: "The fruit has a long harvest period, and the young fruit is green and equal in maturity. When ripe, the fruit turns red. It tastes very spicy and comfortable. Season with fried vegetables.",
    tip: "Direct seeding, seedling raising and transplanting are appropriate, with good drainage and sandy compostSoil, sufficient sunshine is the best, regular watering and fertilization.",
    notice: nil,
    temperature: (24, 30),
    sowingPeriod: (3, 6),
    matureTime: 180,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 15),
        Event("Fertilizing", 20)
    ],
    singleEvents: [
        Event("Water", 0)
    ]
)

var scallion = Plant(
    name: "Scallion", 
    botanical: "Allium fistulosum",
    description: "The leaves are upright, with green and white stems, and some of the green leaves are hollow. They are buried in the soil to lengthen the soft and white parts. They like cool and cold climate and are also quite resistant to heat. They are used in salads, vegetable soups, stews, fried vegetables, boiled vegetables, fried cheese and other multi-purpose spicy vegetables.",
    tip: "The seeds are sown in the seedbed, pulled out to an interval of 3cm after germination, and planted in the border stock after about 50 days. The plant distance is 6-10cm. After soil cultivation for 2-3 times, it can be harvested in about 80 days.",
    notice: "The drainage must be good and dry proof, and the root must be covered with soil to lengthen the soft and white part.",
    temperature: nil,
    sowingPeriod: (3, 5),
    matureTime: 80,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 17)
    ],
    singleEvents: [
        Event("Water", 0),
        Event("Replant in border stock", 50),
        Event("Cultivate soil", 60),
        Event("Cultivate soil", 70)
    ]
)

var paiTsai = Plant(
    name: "Pai-Tsai", 
    botanical: "Brassica rapa",
    description: "The plant height is upright, the petiole is thick and snow-white, round green, the vein is white, and the leaf surface is smooth without fluff and slightly shiny. Chinese cabbage with plant height of 30-40 cm, 15 leaves, thick leaves, disease resistance, transportation resistance, not easy to wither and not heading. It is suitable for cooking, frying or pickling. It tastes very crisp and tender.",
    tip: "After the base fertilizer is fully applied in the stock border, it is turned over and mixed into the soil, leveled and sowed, slightlyAdd a layer of cheese, and then apply grass and water. After germination, remove the grass and pull it out during the growth periodAvoid overdense and overgrown, and become slender and thin plants, which will not only affect the yield, but also have poor appearance. straightSown non heading Chinese cabbage can be pulled out and harvested one after another when 2 ~ 3 leaves are unfolded,It is suitable for harvest at any time until moss is drawn.",
    notice: nil,
    temperature: nil,
    sowingPeriod: (1, 12),
    matureTime: 35,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 15)
    ],
    singleEvents: [
        Event("Water", 0)
    ]
)

var mint = Plant(
    name: "Mint", 
    botanical: "Mentha canadensis",
    description: "The leaves are thick green and contain light mint fragrance. It is a natural plant spice rich in vitamins. It is alsoIndispensable ingredients for cooking",
    tip: "Select sunny or partially shaded location and sow quickly ground. Keep soil temperature in mid-70's. Leaves are excellent for cooking.",
    notice: nil,
    images: ["Hot_Pepper_1", "Hot_Pepper_2"],
    temperature: (21, 26),
    sowingPeriod: (1, 12),
    matureTime: 60,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 13),
        Event("Fertilizing", 30)
    ],
    singleEvents: [
        Event("Water", 0)
    ]
)

var sweetPepper = Plant(
    name: "Sweet Pepper", 
    botanical: "Capsicum annuum",
    description: "The fruit is green in color, the meat is crisp and rich in vitamins,It is a fruit and vegetable with high nutritional value. Adaptation of high temperature cropsFor cultivation at temperatures above 20 ℃, the soil should be fertile and not too dry.",
    tip: "Shape: Elongated bell with thick walls good for stuff or salads. Germination: 10 days at 80°F. Sensitive extremes in temperature moisture and direct sunlight and very susceptible to frost damage. Transplant when first true leaves open. Fertilize nitrogen 2 ~3 weeks after transplanting.",
    notice: "After planting, bamboo is used to insert the pillar obliquely to prevent diseases and pests.",
    temperature: (25, 35),
    sowingPeriod: (2, 5),
    matureTime: 50,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 14),
        Event("Fertilizing", 40)
    ],
    singleEvents: [
        Event("Water", 0),
        Event("Transplant", 30)
    ]
)

var tomato = Plant(
    name: "Tomato", 
    botanical: "Lycopersicon esculentum",
    description: "Red fruit, abundant and round, with a diameter of 3 ~ 4cm and thick pulp. It is prolific with 70 ~ 80 seeds per plant. It is suitable for good drainage and sunny places. It is most suitable for growth at 20 ~ 30 ° C",
    tip: "Fruit smooth and bright red, with green shoulder. Sow seed in well prepared smoothed soil and cover 0.3cm deep, transplant when grow 5~6 leaves. At least 40cm between plants, in the row. Graminate 25~30 C in 6~8 days.",
    notice: "High temperature is bad for fruit, and the pistil is picked at about the fifth stage.",
    temperature: (25, 35),
    sowingPeriod: (2, 5),
    matureTime: 50,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 18)
    ],
    singleEvents: [
        Event("Water", 0)
    ]
)

var whiteIcicleRadish = Plant(
    name: "White Icicle Radish", 
    botanical: "Raphanus sativus",
    description: "Radish is an annual plant and vegetable of root vegetables, which is divided into springIt is planted in summer and autumn. The meat is white, crisp and tender, and is loved by people. With a length of 20 ~ 30cm, it is used for raw food, soup and pickles.",
    tip: "Like sandy soil, table people should be deeply cultivated, compost in a well drained place and make the whole border. The plant spacing is 15x15cm, 3-4 seeds are sown every six, one plant is pulled out after germination, and it is harvested 50 ~ 60 days after growth.",
    notice: nil,
    temperature: (20, 30),
    sowingPeriod: (1, 12),
    matureTime: 100,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 10)
    ],
    singleEvents: [
        Event("Water", 0),
        Event("Pull out weak ones", 14)
    ]
)

var basil = Plant(
    name: "Basil", 
    botanical: "Ocimum basilcum",
    description: "It is 30 ~ 40 cm, with thick green and pointed tail leaves opposite each other. It is rough. Any scholar can be planted and easy to cultivate. Leaves can be used as seasoning for cooking. They have a special taste and can also be used as medicine.",
    tip: "A perennial plant, grows in clusters about 1 foot (30cm) tall, very fine onion leaves used for flavoring soups. Plant antime indoors, spring is best time to sow seeds. Plant at outdoor Seedling emerge in 6 das. At 68F~95°F in rows 20 inches apart, sow seed about 12~14 inches apart. 50~90days to harvest.",
    notice: nil,
    temperature: (20, 30),
    sowingPeriod: (2, 10),
    matureTime: 70,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 17),
        Event("Fertilizing", 24)
    ],
    singleEvents: [
        Event("Water", 0)
    ]
)

var asparagus = Plant(
    name: "Asparagus", 
    botanical: "Asparagus officinalis",
    description: "The suitable temperature for growth is 20 ~ 25 degrees Celsius. It likes tide and cold temperature. It is coarseThe rope like fleshy adventitious root should go deep into the soil, so it needs deep ploughing. The soil is slightly acidic to neutral, and can be fried with raw cooking oil. It is a perennial vegetable and easy to cultivate",
    tip: "1.Mary washington large, one year old roots, plant early in light soil. light cutting next spring, regular each year after. 2.A high yielding variety, suitabe for both fresh market and processing. 3.Large spears, pale yellow, green with tight heads. 4.Seeds germinate at 15~30°C",
    notice: "In order to promote germination, soak the seeds in warm water before and after 30 ° C for 2 ~ 3 days before sowing, discard the water and air dry the seeds.",
    temperature: (18, 25),
    sowingPeriod: (2, 5),
    matureTime: 90,
    plantedTime: nil,
    intervalEvents: [
        Event("Fertilizing", 24)
    ],
    singleEvents: [
        Event("Water", 0)
    ]
)

var snowPeas = Plant(
    name: "Snow Peas", 
    botanical: "Pisum sativum",
    description: "Purplish red and white flowers are also suitable for viewing and easy to cultivate.",
    tip: "1.Latest improvement on the red-flowered tall growing large podded. 2. Broad pod 8 cm long and of bright green wrinkled white seed. 3. Good for fresh market and home garden thrive in cool area with good drainage. Suitable to plant from august to december seeds germinate 20 ~25°C",
    notice: "Put some lime and plant ash to neutralize the acid land. Do not rotate. When the green pods are fully enlarged, but the outer pods are still green, it is the appropriate harvest period.",
    temperature: (20, 25),
    sowingPeriod: (7, 12),
    matureTime: 90,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 12)
    ],
    singleEvents: [
        Event("Water", 0)
    ]
)

var waxGourd = Plant(
    name: "Wax Gourd", 
    botanical: "Benincass hlispida",
    description: "Annual trailing herb, melon shaped, long and huge. Light green, smooth, thick and hard skin, white and crisp meat, like warm climate, like river bed, sandy, deep and fertile soil",
    tip: "Grown for its thick white flesh used for the chinese style soupand for cooking 2.Fruit 70~80cm long, green skin, suitable planting in autumnand winter.3. Suitable to plant in sandy soil and shovld prevent from drought and blight damage",
    notice: "About 25 ~ 30 days, 4 ~ 5 leaves are transplanted into this nursery method, so as to immerse the seeds in water for 3 days, sow 2 ~ 3 seeds in each planting hole, cover them with soil, and cover them with a layer of rotten compost and organic fertilizer The row spacing is 4mx the plant spacing is 1.5m. Before flowering, apply chemical fertilizer four times. If there are too many lateral buds, pick the heart, and leave 2 ~ 3 fruits for each plant of vegetables and fruits",
    temperature: (25, 30),
    sowingPeriod: (9, 12),
    matureTime: 180,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 14)
    ],
    singleEvents: [
        Event("Water", 0),
        Event("Transplant", 27)
    ]
)

var eggPlant = Plant(
    name: "Egg Plant", 
    botanical: "Salanum melongena",
    description: "The fruit shape is slender and slightly curved, with a length of 30 ~ 40 cmThe color is purplish red, the skin is thin, and the meat is white and tender. It can be boiled and fried. It can be a salty vegetable for all ages. Any place with good soil, ventilation and drainage can be planted all year round",
    tip: "The seeds were soaked in lukewarm water for one day and germinated at 30 ° C for 7 ~ 8 days. When the seedlings reach 5 ~ 6 leaves of this leaf, they shall be transplanted, fully exposed to sunlight, and the row spacing shall be 40 × 50cm plant spacing, chicken manure and chemical fertilizer as topdressing",
    notice: "When transplanting, the fine roots shall not be interrupted. Be careful to plant, erect inclined pillars, and do not cut off fertilizer",
    temperature: (25, 35),
    sowingPeriod: (2, 5),
    matureTime: 120,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 14)
    ],
    singleEvents: [
        Event("Water", 0),
        Event("Transplant", 30)
    ]
)

var bitterMelon = Plant(
    name: "Bitter Melon", 
    botanical: "Momordica charantia",
    description: "Dark green and tapering to a point at each end with a delighted bitter taste. Sow seeds in spring to late summer. Best growing temperature is above 20°C. Plant seeds 3~4cm deep and 1½ meters apart. Better quality fruits of plant. Grow on trellis. Pick fruits when still green.",
    tip: "Prepare the land for high border, and the plant spacing is 15cm. The seeds are soaked to promote germination, and then put into the seedling bag after sprouting. 3-4 pieces of this leaf are planted. Apply more fertilizer, and when the vine grows, insert the bamboo pole pillar to make a dangerous road type scaffold. The temperature is high in summer, so it should be harvested at 7:00. The number of germination days is 7 ~ 8 days, and the harvest time is 100 ~ 120 days",
    notice: "",
    temperature: (25, 30),
    sowingPeriod: (3, 6),
    matureTime: 100,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 18)
    ],
    singleEvents: [
        Event("Water", 0),
        Event("Make Scaffold", 60)
    ]
)

var malabarSpinach = Plant(
    name: "Malabar Spinach", 
    botanical: "Basella alba",
    description: "The leaves are oval, the mesophyll is thick, and the vine stalks alternate on the leaf edges. It is a vine crop. It has strong branching and rapid elongation. After growing into a plant, it grows into a spike from the leaf axil. The flower spike has no petals and likes high temperature and humidity. Strong fertility, rich in vitamins A, B1, B2, 1 and calcium, and edible leaves and stems",
    tip: "Sandy soil rich in organic matter should be selected as the base fertilizer. The border is 6 feet wide, one row is sown, the plant spacing is 35cmx40cm, and 1 ~ 2 seeds are planted in each hole. Leave one plant when the leaf is 3 ~ 4, and erect a pillar when the leaf is 6 ~ 7. The fertilizer is used to compost the fertilizer cake. No pests, no pesticides, so it is called healthy vegetables",
    notice: "",
    temperature: (18, 30),
    sowingPeriod: (2, 10),
    matureTime: 80,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 13)
    ],
    singleEvents: [
        Event("Water", 0)
    ]
)

var okra = Plant(
    name: "Okra", 
    botanical: "Abelmoschus esculentus",
    description: "The pod is emerald green, the fruit surface is soft and smooth, and the cross section is pentagonal chopped and sticky tender fruit. Raw food has a special flavor. It is delicious as Tonga white vinegar and pickled in miso. It contains protein and minerals and is rich in nutrition. It is a high-temperature vegetable",
    tip: "The width of the border is 1cm, the distance between plants is 40x50cm, 1 ~ 2 seeds are directly sown, and the growth is vigorous. Chemical fertilizer and other topdressing should be applied every 30 days. The soil should be covered between plants, and bamboo pillars should be erected and tied",
    notice: "The young fruit of 3-5cm will be produced 2-4 days after the flower withers, and the fruit will harden, so it is harvested every day. Ripe fruits can be used for ornamental purposes and cultivated with more fertilizer",
    temperature: (20, 35),
    sowingPeriod: (4, 9),
    matureTime: 90,
    plantedTime: nil,
    intervalEvents: [
        Event("Water", 15)
    ],
    singleEvents: [
        Event("Water", 0),
        Event("Make Scaffold", 25)
    ]
)
